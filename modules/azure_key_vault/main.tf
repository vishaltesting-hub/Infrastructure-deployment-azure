# get current tenant / object id
data "azurerm_client_config" "current" {}

# key vaults
resource "azurerm_key_vault" "kv" {
  for_each = var.kvs

  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  sku_name                    = each.value.sku_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = lookup(each.value, "soft_delete_retention_days", 7)
  purge_protection_enabled    = lookup(each.value, "purge_protection_enabled", false)
  tags                        = try(each.value.tags, {})

  # default access policy: current principal (useful for automation)
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
      "List",
      "Create",
      "Update",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
    ]

    storage_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    
  }
}


# Create Key Vault secrets from the provided kvs[*].secrets maps using an inline for_each
resource "azurerm_key_vault_secret" "secrets" {
  for_each = merge([
    for kv_key, kv in var.kvs : {
      for s_key, s in kv.secrets : "${kv_key}.${s_key}" => {
        kv_key = kv_key
        name   = s.name
        value  = s.value
      }
    }
  ]...)

  name         = each.value.name
  value        = each.value.value
  key_vault_id = azurerm_key_vault.kv[each.value.kv_key].id

  depends_on = [azurerm_key_vault.kv]
}

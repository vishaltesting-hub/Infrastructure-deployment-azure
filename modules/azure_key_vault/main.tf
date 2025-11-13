provider "azurerm" {
  # Configuration options
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    }
}
data "azurerm_client_config" "current" {

}
resource "azurerm_key_vault" "kv" {
  for_each                 = var.kvs
  name                     = each.value.name
  location                 = each.value.location
  resource_group_name      = each.value.rg_name
  sku_name                 = each.value.sku_name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled = "false"
  tags                     = each.value.tags

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
      "Restore"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    storage_permissions = [
        "Get",
        ]  
    }

}


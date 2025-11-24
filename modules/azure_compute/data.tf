data "azurerm_subnet" "subnet" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name

}
data "azurerm_public_ip" "public-ip" {
  for_each            = var.vms
  name                = each.value.public_ip_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault" "kv" {
  for_each            = var.vms
  name                = each.value.kv_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "vm_username" {
  for_each = var.vms
  name         = each.value.kv_name.secret1.name
  key_vault_id = data.azurerm_key_vault.kv_name[each.key].id
}
data "azurerm_key_vault_secret" "vm_password" {
  for_each = var.vms
  name         = each.value.kv_name.secret2.name
  key_vault_id = data.azurerm_key_vault.kv_name[each.key].id
}
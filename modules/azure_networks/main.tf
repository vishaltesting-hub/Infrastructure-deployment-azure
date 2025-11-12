resource "azurerm_virtual_network" "vnets" {
  for_each            = var.vnets
  name                = each.value.vnet_name
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

 dynamic "subnet" {
   for_each = each.value.subnets != null ? each.value.subnets : {}     # with null condition
  # for_each = each.value.subnets                                     # Alternative without null check
  content {
    name             = subnet.value.name
    address_prefixes = subnet.value.address_prefix
  }
}
}

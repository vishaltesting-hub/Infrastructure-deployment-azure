resource "azurerm_network_interface" "nic-dev" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  tags                = each.value.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.public-ip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each         = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = data.azurerm_key_vault_secret[each.key].vm_username.value
  admin_password      = data.azurerm_key_vault_secret[each.key].vm_password.value
  tags                = each.value.tags
  custom_data = filebase64("${path.module}/ngnix.sh")
  disable_password_authentication = "false"
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]


  os_disk {
    caching              =  each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = "latest"
  }
}

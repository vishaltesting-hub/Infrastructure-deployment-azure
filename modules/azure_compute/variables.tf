variable "vms" {
  description = "Map of VM definitions"
  type = map(object({
    nic_name                        = optional(string, "")
    vm_name                         = optional(string, "")
    rg_name                         = optional(string, "")
    location                        = optional(string, "")
    vm_size                         = optional(string, "")
    custom_data                     = optional(string, null)
    tags                            = optional(map(string), {})
    disable_password_authentication = optional(bool, false)
    os_disk_caching                 = optional(string, null)
    os_disk_storage_account_type    = optional(string, null)
    source_image_reference = optional(object({
      publisher = string
      offer     = string
      sku       = string
      version   = optional(string, "latest")
    }), null)
    subnet_name                     = optional(string, "")
    vnet_name                       = optional(string, "")
    public_ip_name                  = optional(string, "")
    kv_name                         = optional(string, "")
    vm_username_secret_name         = optional(string, "")
    vm_password_secret_name         = optional(string, "")
    # optional plain-text fallbacks (not recommended for prod)
    admin_username                  = optional(string, "")
    admin_password                  = optional(string, "")
  }))
  default = {}
}

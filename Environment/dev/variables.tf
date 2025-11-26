variable "resource_group" {

  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))

}

variable "storage_account" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = optional(map(string))
    account_kind             = optional(string, "StorageV2")
  }))
}

variable "vnets" {
  type = map(object({
    vnet_name           = string
    address_space       = list(string)
    location            = string
    resource_group_name = string
    tags                = optional(map(string))
    subnets = optional(map(object({
      name           = string
      address_prefix = list(string)
    })))
  }))
}
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

variable "public_ip" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
    tags                = optional(map(string))
  }))
  
}
variable "kvs" {
  description = "Map of Key Vault definitions; each value can include 'secrets' map for creation."
  type = map(object({
    name                        = string
    resource_group_name         = string
    location                    = string
    sku_name                    = string
    tags                        = optional(map(string))
    purge_protection_enabled    = optional(bool, false)
    soft_delete_retention_days  = optional(number, 7)
    storage_permissions         = optional(list(string), [])
    # secrets is a map of objects with name & value
    secrets = optional(map(object({
      name  = string
      value = string
    })), {})
  }))
}

variable "subscription_id" {
  description = "Optional Azure subscription id. Set to null or omit to use environment/CLI credentials (ARM_SUBSCRIPTION_ID or `az login`)."
  default     = "6dbc33a2-5da4-4090-8ac2-b8dde7d2a834"
}
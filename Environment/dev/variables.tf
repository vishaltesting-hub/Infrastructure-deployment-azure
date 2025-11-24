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
  description = "A map of VM configurations"
  type = map(object({
    nic_name                        = string
    vm_name                         = string
    rg_name                         = string
    location                        = string
    vm_size                         = string
    admin_username                  = string
    admin_password                  = string
    tags                            = map(string)
    disable_password_authentication = string
    os_disk_caching                 = string
    os_disk_storage_account_type    = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
    })
  }))

}

variable "kvs" {
  type = map(object({
    name                     = string
    location                 = string
    rg_name                  = string
    tenant_id                = string
    sku_name                 = string
    purge_protection_enabled = bool
    tags                     = optional(map(string))
    access_policys = optional(list(object({
      tenant_id          = string
      object_id          = string
      key_permissions    = list(string)
      secret_permissions = list(string)
    })))
  }))
}

variable "subscription_id" {
  description = "Optional Azure subscription id. Set to null or omit to use environment/CLI credentials (ARM_SUBSCRIPTION_ID or `az login`)."
  default     = "6dbc33a2-5da4-4090-8ac2-b8dde7d2a834"
}
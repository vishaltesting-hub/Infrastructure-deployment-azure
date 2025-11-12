
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

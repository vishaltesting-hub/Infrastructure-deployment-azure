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

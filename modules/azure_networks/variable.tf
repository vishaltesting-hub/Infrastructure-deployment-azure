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

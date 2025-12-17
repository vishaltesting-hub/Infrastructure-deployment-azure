variable "mssql_servers" {
  description = "A map of Azure MySQL server configurations."
  type = map(object({
    name                   = string
    resource_group_name    = string
    location               = string
    version                = string
    administrator_login    = string
    administrator_password = string
    tags                   = optional(map(string))
  }))

}

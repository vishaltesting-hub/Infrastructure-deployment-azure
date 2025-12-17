variable "mssql_databases" {
  description = "A map of Azure MSSQL database configurations."
  type = map(object({
    name             = string
    mssql_server_key = string
    max_size_gb      = number
    sku_name         = optional(string)
    zone_redundant   = optional(bool)
    tags             = optional(map(string))
  }))
}

variable "mssql_server_ids" {
  description = "Map of MSSQL server IDs keyed by server name"
  type        = map(string)
}


variable "load_balancers" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                = string
    public_ip_name     = string
    frontend_name      = string
    backend_pool_name  = string
    probe_name         = string
    rule_name          = string
    frontend_port      = number
    backend_port       = number
  }))
}

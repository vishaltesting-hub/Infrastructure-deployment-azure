resource "azurerm_lb" "lb" {
  for_each            = var.load_balancers
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku

  frontend_ip_configuration {
    name                 = each.value.frontend_name
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "backend" {
  for_each = var.load_balancers

  name            = each.value.backend_pool_name
  loadbalancer_id = azurerm_lb.lb[each.key].id
}
resource "azurerm_lb_probe" "probe" {
  for_each = var.load_balancers

  name            = each.value.probe_name
  loadbalancer_id = azurerm_lb.lb[each.key].id
  protocol        = "Tcp"
  port            = each.value.backend_port
}
resource "azurerm_lb_rule" "rule" {
  for_each = var.load_balancers

  name                           = each.value.rule_name
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  protocol                       = "Tcp"
  frontend_port                  = each.value.frontend_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = each.value.frontend_name
  backend_address_pool_ids       = [
    azurerm_lb_backend_address_pool.backend[each.key].id
  ]
  probe_id = azurerm_lb_probe.probe[each.key].id
}

resource "azurerm_mssql_server" "mssql_server" {
  for_each = var.mssql_servers

  # Use the attribute names defined by the module variable type
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_password
  version                      = each.value.version

  tags = try(each.value.tags, {})
}

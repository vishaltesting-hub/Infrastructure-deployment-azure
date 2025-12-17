resource "azurerm_mssql_database" "mssql_database" {
  for_each = var.mssql_databases

  name           = each.value.name
  server_id      = var.mssql_server_ids[each.value.mssql_server_key]
  max_size_gb    = each.value.max_size_gb
  sku_name       = each.value.sku_name

  tags = each.value.tags
}

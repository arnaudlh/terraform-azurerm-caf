# This resource is deprecated and will be removed in v4.0 of the AzureRM Provider
# Azure Database for MariaDB and its sub resources are scheduled for retirement by 2024-09-19
# TODO: Migrate to azurerm_mysql_flexible_server_virtual_network_rule in a future release
resource "azurerm_mariadb_virtual_network_rule" "mariadb_vnet_rules" {
  for_each            = try(var.settings.mariadb_vnet_rules, {})
  name                = each.value.name
  resource_group_name = local.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb.name
  subnet_id           = var.subnet_id
}

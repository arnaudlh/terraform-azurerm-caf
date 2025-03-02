
#
# Firewall Rule
#

# This resource is deprecated and will be removed in v4.0 of the AzureRM Provider
# Azure Database for MariaDB and its sub resources are scheduled for retirement by 2024-09-19
# TODO: Migrate to azurerm_mysql_flexible_server_firewall_rule in a future release
resource "azurerm_mariadb_firewall_rule" "mariadb_firewall_rules" {
  for_each = try(var.settings.mariadb_firewall_rules, {})

  name                = each.value.name
  resource_group_name = local.resource_group_name
  server_name         = azurerm_mariadb_server.mariadb.name
  start_ip_address    = each.value.start_ip_address
  end_ip_address      = each.value.end_ip_address
}

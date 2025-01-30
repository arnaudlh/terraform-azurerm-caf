resource "azurerm_route_table" "rt" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  bgp_route_propagation_enabled = try(var.settings.bgp_route_propagation_enabled, true)
  tags                          = local.tags
}

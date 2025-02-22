mock_data "azurerm_postgresql_server" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DBforPostgreSQL/servers/mock-psql"
    name                = "mock-psql"
    location            = "eastus"
    resource_group_name = "mock-rg"
    version            = "11"
    sku_name           = "GP_Gen5_2"
    administrator_login = "psqladmin"
  }
}

mock_data "azurerm_virtual_network" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet"
    name                = "mock-vnet"
    location            = "eastus"
    resource_group_name = "mock-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

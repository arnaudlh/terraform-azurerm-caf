mock_resource "azurerm_virtual_network" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet"
    name                = "mock-vnet"
    location            = "westeurope"
    resource_group_name = "mock-rg"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = []
    bgp_community      = null
    flow_timeout_in_minutes = null
    subnet             = []
  }
}

mock_resource "azurerm_subnet" {
  defaults = {
    id                                      = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet/subnets/mock-subnet"
    name                                    = "mock-subnet"
    resource_group_name                     = "mock-rg"
    virtual_network_name                    = "mock-vnet"
    address_prefixes                        = ["10.0.1.0/24"]
    service_endpoints                       = []
    private_endpoint_network_policies_enabled = true
    private_link_service_network_policies_enabled = true
    delegation                              = []
  }
}

mock_resource "azurerm_resource_group" {
  defaults = {
    id       = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg"
    name     = "mock-rg"
    location = "westeurope"
  }
}

mock_data "azurerm_virtual_network" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet"
    name                = "mock-vnet"
    location            = "eastus"
    resource_group_name = "mock-rg"
    address_space       = ["10.0.0.0/16"]
  }
}

mock_data "azurerm_subnet" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet/subnets/mock-subnet"
    name                = "mock-subnet"
    resource_group_name = "mock-rg"
    virtual_network_name = "mock-vnet"
    address_prefixes    = ["10.0.1.0/24"]
  }
}

mock_data "azurerm_network_interface" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/networkInterfaces/mock-nic"
    name                = "mock-nic"
    location            = "eastus"
    resource_group_name = "mock-rg"
    ip_configuration    = [{
      name                          = "internal"
      subnet_id                     = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet/subnets/mock-subnet"
      private_ip_address_allocation = "Dynamic"
    }]
  }
}

mock_data "azurerm_public_ip" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/publicIPAddresses/mock-pip"
    name                = "mock-pip"
    location            = "eastus"
    resource_group_name = "mock-rg"
    allocation_method   = "Static"
    ip_address          = "20.0.0.1"
  }
}

mock_data "azurerm_network_security_group" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/networkSecurityGroups/mock-nsg"
    name                = "mock-nsg"
    location            = "eastus"
    resource_group_name = "mock-rg"
  }
}

mock_data "azurerm_application_security_group" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/applicationSecurityGroups/mock-asg"
    name                = "mock-asg"
    location            = "eastus"
    resource_group_name = "mock-rg"
  }
}

mock_data "azurerm_route_table" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/routeTables/mock-rt"
    name                = "mock-rt"
    location            = "eastus"
    resource_group_name = "mock-rg"
  }
}

mock_data "azurerm_firewall" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/azureFirewalls/mock-fw"
    name                = "mock-fw"
    location            = "eastus"
    resource_group_name = "mock-rg"
    ip_configuration    = [{
      name                 = "configuration"
      subnet_id            = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworks/mock-vnet/subnets/AzureFirewallSubnet"
      public_ip_address_id = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/publicIPAddresses/mock-fw-pip"
    }]
  }
}

mock_data "azurerm_application_gateway" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/applicationGateways/mock-appgw"
    name                = "mock-appgw"
    location            = "eastus"
    resource_group_name = "mock-rg"
  }
}

mock_data "azurerm_load_balancer" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/loadBalancers/mock-lb"
    name                = "mock-lb"
    location            = "eastus"
    resource_group_name = "mock-rg"
    sku                 = "Standard"
  }
}

mock_data "azurerm_private_dns_zone" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/privateDnsZones/mock.private.dns"
    name                = "mock.private.dns"
    resource_group_name = "mock-rg"
  }
}

mock_data "azurerm_dns_zone" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/dnsZones/mock.dns"
    name                = "mock.dns"
    resource_group_name = "mock-rg"
  }
}

mock_data "azurerm_virtual_wan" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualWans/mock-vwan"
    name                = "mock-vwan"
    location            = "eastus"
    resource_group_name = "mock-rg"
  }
}

mock_data "azurerm_virtual_hub" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualHubs/mock-vhub"
    name                = "mock-vhub"
    location            = "eastus"
    resource_group_name = "mock-rg"
    virtual_wan_id      = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualWans/mock-vwan"
    address_prefix      = "10.0.0.0/23"
  }
}

mock_data "azurerm_express_route_circuit" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/expressRouteCircuits/mock-er"
    name                = "mock-er"
    location            = "eastus"
    resource_group_name = "mock-rg"
    service_provider_name = "Equinix"
    peering_location    = "Washington DC"
    bandwidth_in_mbps   = 50
  }
}

mock_data "azurerm_vpn_gateway" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/vpnGateways/mock-vpngw"
    name                = "mock-vpngw"
    location            = "eastus"
    resource_group_name = "mock-rg"
    virtual_hub_id      = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualHubs/mock-vhub"
  }
}

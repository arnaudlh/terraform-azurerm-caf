mock_resource "azurerm_virtual_network_gateway" {
  defaults = {
    id                           = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworkGateways/mock-vng"
    name                         = "mock-vng"
    location                     = "westeurope"
    resource_group_name          = "mock-rg"
    type                         = "Vpn"
    vpn_type                     = "RouteBased"
    sku                          = "VpnGw1"
    enable_bgp                   = false
    active_active                = false
    private_ip_address_enabled   = false
    default_local_network_gateway_id = null
    vpn_client_configuration     = []
    bgp_settings                 = []
    custom_route                 = []
    ip_configuration            = []
  }
}

mock_resource "azurerm_virtual_network_gateway_connection" {
  defaults = {
    id                          = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/connections/mock-connection"
    name                        = "mock-connection"
    location                    = "westeurope"
    resource_group_name         = "mock-rg"
    type                        = "IPsec"
    virtual_network_gateway_id  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/virtualNetworkGateways/mock-vng"
    authorization_key           = null
    dpd_timeout_seconds        = null
    express_route_circuit_id   = null
    peer_virtual_network_gateway_id = null
    local_azure_ip_address_enabled = false
    local_network_gateway_id   = null
    routing_weight            = 10
    shared_key                = null
    connection_mode           = "Default"
    connection_protocol       = "IKEv2"
    enable_bgp               = false
  }
}

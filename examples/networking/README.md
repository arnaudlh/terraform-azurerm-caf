# Azure Networking

This module is part of Cloud Adoption Framework landing zones for Azure on Terraform.

You can instantiate this directly using the following parameters:

```hcl
module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "5.1.0"
  # insert the 7 required variables here
}
```

For reference on how to consume the module, please refer to the [root of this folder](../README.md).

## Networking examples

The following examples are ready for consumption:

| directory | examples | description |
| -- | -- | -- |
| bastion | [101-bastion-with-vm](./101-bastion-with-vm)  | Simple Azure Bastion with a virtual machine with private IP address accesible via Bastion |
| dns_zones | [100-simple-dns_zone](./100-simple-dns_zone)  | Simple DNS zones with a set of sample records. |
...

The ```networking``` object can contain the following objects:

```bash
    application_gateway_applications
    application_gateway_waf_policies
    application_gateways
    application_security_groups
    azurerm_firewall_application_rule_collection_definition
    azurerm_firewall_nat_rule_collection_definition
    azurerm_firewall_network_rule_collection_definition
    azurerm_firewall_policies
    azurerm_firewall_policy_rule_collection_groups
    azurerm_firewalls
    azurerm_routes
    dns_zone_records
    dns_zones
    domain_name_registrations
    express_route_circuit_authorizations
    express_route_circuits
    front_door_waf_policies
    front_doors
    ip_groups
    load_balancers
    local_network_gateways
    network_security_group_definition
    network_watchers
    private_dns
    private_endpoints
    public_ip_addresses
    route_tables
    vhub_peerings
    virtual_hub_connections
    virtual_hub_er_gateway_connections
    virtual_hub_route_tables
    virtual_hubs
    virtual_network_gateway_connections
    virtual_network_gateways
    virtual_wans
    vnet_peerings
    vnets
    vpn_gateway_connections
    vpn_sites
```
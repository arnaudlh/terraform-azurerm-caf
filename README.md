# Cloud Adoption Framework for Azure - Terraform module

> :warning: This solution, offered by the Open-Source community, will no longer receive contributions from Microsoft. Customers are encouraged to transition to [Microsoft Azure Verified Modules](https://aka.ms/avm) for Microsoft support and updates.

## Overview

This module provides a comprehensive set of Terraform resources for deploying and managing Azure infrastructure following the [Cloud Adoption Framework (CAF)](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/) best practices. It allows you to create resources on Microsoft Azure, is used by the Azure Terraform SRE to provision resources in an Azure subscription, and can deploy resources being directly invoked from the Terraform registry.

The module supports a wide range of Azure services and resources, including:
- Compute (Virtual Machines, AKS, Container Instances, etc.)
- Networking (Virtual Networks, Load Balancers, Application Gateways, etc.)
- Storage (Storage Accounts, Data Lake, etc.)
- Databases (SQL, MySQL, PostgreSQL, Cosmos DB, etc.)
- Identity and Access Management (Azure AD, Managed Identities, etc.)
- And many more Azure services

## Prerequisites

- Setup your **environment** using the following guide [Getting Started](https://github.com/aztfmod/caf-terraform-landingzones/blob/master/documentation/getting_started/getting_started.md) or you use it online with [GitHub Codespaces](https://github.com/features/codespaces).
- Access to an **Azure subscription**.
- Terraform version >= 1.4.0
- Required providers:
  - AzureRM provider
  - AzureAD provider (for Azure Active Directory resources)
  - AzureCAF provider (for naming convention)

## Getting started

This module can be used in two ways:
1. Inside [:books: Azure Terraform Landing zones](https://aztfmod.github.io/documentation/) as part of a larger landing zone deployment
2. As standalone, directly from the [Terraform registry](https://registry.terraform.io/modules/aztfmod/caf/azurerm/)

### Standalone usage

```terraform
module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "~>5.7.0"
  
  providers = {
    azurerm.vhub = azurerm.vhub
  }
  
  global_settings = var.global_settings
  resource_groups = var.resource_groups
  
  # Add the resource blocks you need
  compute = {
    virtual_machines = var.virtual_machines
  }
  
  networking = {
    virtual_networks = var.virtual_networks
    public_ip_addresses = var.public_ip_addresses
  }
}
```

For a quick example with all required variables, see the [standalone example](https://github.com/aztfmod/terraform-azurerm-caf/tree/master/examples/standalone.md).

For a complete set of examples covering various Azure services, review the [examples library](https://github.com/aztfmod/terraform-azurerm-caf/tree/master/examples).

<img src="https://aztfmod.azureedge.net/media/standalone.gif" width="720"/> <br/> <br/>

## Module structure

The module is organized as follows:
- Root module: Contains the main logic and calls to sub-modules
- Sub-modules: Located in the `/modules` directory, each handling specific Azure resources
- Examples: Located in the `/examples` directory, demonstrating various usage scenarios

## Testing

All examples in the `/examples` directory are tested using mock providers instead of real Azure connections. Each subfolder in `/examples` represents a different test case that needs to be validated.

## Documentation

- [Module conventions and development guidelines](./documentation/conventions.md)
- [Upgrade notes for version changes](./UPGRADE.md)
- [Examples and usage patterns](./examples/README.md)

## Community

Feel free to open an issue for feature or bug, or to submit a PR, [Please check out the WIKI for coding standards, common patterns and PR checklist.](https://github.com/aztfmod/terraform-azurerm-caf/wiki)

You can also reach us on [Gitter](https://gitter.im/aztfmod/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Contributing

This project welcomes contributions and suggestions. Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit <https://cla.opensource.microsoft.com>.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

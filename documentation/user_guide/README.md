# Cloud Adoption Framework for Azure - Terraform Module User Guide

This user guide provides comprehensive documentation for using the CAF Terraform module to deploy and manage Azure resources.

## Table of Contents

1. [Introduction](#introduction)
2. [Module Structure](#module-structure)
3. [Getting Started](#getting-started)
4. [Global Settings](#global-settings)
5. [Resource Groups](#resource-groups)
6. [Naming Convention](#naming-convention)
7. [Common Resource Types](#common-resource-types)
8. [Advanced Usage](#advanced-usage)
9. [Troubleshooting](#troubleshooting)

## Introduction

The Cloud Adoption Framework (CAF) Terraform module for Azure provides a standardized approach to deploying and managing Azure resources using Terraform. It follows the best practices outlined in the Microsoft Cloud Adoption Framework and provides a consistent way to deploy resources across multiple environments.

## Module Structure

The module is organized as follows:

- Root module: Contains the main logic and calls to sub-modules
- Sub-modules: Located in the `/modules` directory, each handling specific Azure resources
- Examples: Located in the `/examples` directory, demonstrating various usage scenarios

## Getting Started

To get started with the CAF module, you need to:

1. Set up your environment following the [Getting Started guide](https://github.com/aztfmod/caf-terraform-landingzones/blob/master/documentation/getting_started/getting_started.md)
2. Create a Terraform configuration file that includes the CAF module
3. Define the required variables for your deployment
4. Initialize and apply your Terraform configuration

Here's a minimal example:

```terraform
terraform {
  required_providers {
  }
  required_version = ">= 1.4.0"
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  alias = "vhub"
}

module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "5.7.0"

  providers = {
    azurerm.vhub = azurerm.vhub
  }
  
  global_settings = var.global_settings
  resource_groups = var.resource_groups
}
```

## Global Settings

The `global_settings` object is a central configuration object that governs the creation of resources based on common criteria. It includes settings for naming conventions, region deployment, environment name, and tags inheritance.

Example:

```terraform
global_settings = {
  default_region = "region1"
  regions = {
    region1 = "eastus2"
    region2 = "westeurope"
  }
  environment = "dev"
  random_length = 0
  passthrough = false
  inherit_tags = true
  use_slug = true
}
```

## Resource Groups

Resource groups are a fundamental component in Azure that provides a logical container for resources. In the CAF module, resource groups are defined as follows:

```terraform
resource_groups = {
  example_rg = {
    name = "example-resources"
    location = "eastus2"
    tags = {
      environment = "dev"
      project = "example"
    }
  }
}
```

## Naming Convention

The CAF module uses the [Azure CAF Naming provider](https://registry.terraform.io/providers/aztfmod/azurecaf/latest) to ensure consistent naming of resources. The naming convention is applied automatically to all resources created by the module.

## Common Resource Types

The CAF module supports a wide range of Azure resources. Here are some common resource types and how to define them:

### Virtual Networks

```terraform
networking = {
  vnets = {
    example_vnet = {
      resource_group_key = "example_rg"
      vnet = {
        name = "example-network"
        address_space = ["10.0.0.0/16"]
      }
      subnets = {
        subnet1 = {
          name = "subnet1"
          cidr = ["10.0.1.0/24"]
        }
      }
    }
  }
}
```

### Virtual Machines

```terraform
compute = {
  virtual_machines = {
    example_vm = {
      resource_group_key = "example_rg"
      os_type = "linux"
      keyvault_key = "example_kv"
      networking_interfaces = {
        nic0 = {
          vnet_key = "example_vnet"
          subnet_key = "subnet1"
          primary = true
          name = "0"
        }
      }
      virtual_machine_settings = {
        linux = {
          name = "example-vm"
          size = "Standard_F2"
          admin_username = "adminuser"
          disable_password_authentication = true
          os_disk = {
            name = "example-vm-os"
            caching = "ReadWrite"
            storage_account_type = "Standard_LRS"
          }
          source_image_reference = {
            publisher = "Canonical"
            offer = "UbuntuServer"
            sku = "18.04-LTS"
            version = "latest"
          }
        }
      }
    }
  }
}
```

## Advanced Usage

For advanced usage scenarios, refer to the examples in the `/examples` directory. These examples cover a wide range of Azure services and deployment patterns.

## Troubleshooting

Common issues and their solutions:

1. **Provider version conflicts**: Ensure you're using compatible provider versions as specified in the module's requirements.
2. **Resource creation failures**: Check the error messages in the Terraform output and refer to the Azure documentation for specific resource requirements.
3. **Naming convention issues**: Verify that your resource names comply with Azure naming restrictions.
4. **Permission issues**: Ensure your service principal or user account has the necessary permissions to create the resources.

For more help, open an issue on the [GitHub repository](https://github.com/aztfmod/terraform-azurerm-caf/issues).

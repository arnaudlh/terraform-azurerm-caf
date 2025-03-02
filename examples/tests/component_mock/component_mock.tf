terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  use_msi                    = false
}

provider "azuread" {}

variable "global_settings" {
  default = {
    default_region = "region1"
    regions = {
      region1 = "eastus"
    }
    random_length = 5
    prefix        = "caftest"
  }
}

variable "resource_groups" {
  default = {
    test_rg = {
      name = "test-resource-group"
    }
  }
}

output "global_settings" {
  value = var.global_settings
}

output "resource_groups" {
  value = var.resource_groups
}

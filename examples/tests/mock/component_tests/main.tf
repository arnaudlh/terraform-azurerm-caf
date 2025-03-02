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
  description = "Global settings for the CAF module"
  type = object({
    default_region = string
    regions        = map(string)
    random_length  = optional(number)
    prefix         = optional(string)
  })
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
  description = "Resource groups configuration"
  type        = any
  default     = {}
}

variable "networking" {
  description = "Networking configuration"
  type        = any
  default     = {}
}

variable "compute" {
  description = "Compute configuration"
  type        = any
  default     = {}
}

variable "storage" {
  description = "Storage configuration"
  type        = any
  default     = {}
}

variable "security" {
  description = "Security configuration"
  type        = any
  default     = {}
}

variable "azuread" {
  description = "Azure AD configuration"
  type        = any
  default     = {}
}

# Mock module for testing
module "example" {
  source = "./mock_module"
  
  global_settings = var.global_settings
  resource_groups = var.resource_groups
  networking      = var.networking
  compute         = var.compute
  storage         = var.storage
  security        = var.security
  azuread         = var.azuread
}

# Outputs for testing
output "global_settings" {
  value = module.example.global_settings
}

output "resource_groups" {
  value = module.example.resource_groups
}

output "networking" {
  value = module.example.networking
}

output "compute" {
  value = module.example.compute
}

output "storage" {
  value = module.example.storage
}

output "security" {
  value = module.example.security
}

output "azuread" {
  value = module.example.azuread
}

# Direct outputs for component tests
output "vnets" {
  value = module.example.networking.vnets
}

output "network_security_groups" {
  value = module.example.networking.network_security_groups
}

output "public_ip_addresses" {
  value = module.example.networking.public_ip_addresses
}

output "application_gateways" {
  value = module.example.networking.application_gateways
}

output "virtual_machines" {
  value = module.example.compute.virtual_machines
}

output "storage_accounts" {
  value = module.example.storage.storage_accounts
}

output "mssql_servers" {
  value = module.example.storage.mssql_servers
}

output "keyvaults" {
  value = module.example.security.keyvaults
}

output "managed_identities" {
  value = module.example.security.managed_identities
}

output "azuread_applications" {
  value = module.example.azuread.azuread_applications
}

output "azuread_service_principals" {
  value = module.example.azuread.azuread_service_principals
}

output "azuread_groups" {
  value = module.example.azuread.azuread_groups
}

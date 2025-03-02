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
}

variable "resource_groups" {
  description = "Resource groups configuration"
  type        = any
  default     = {}
}

variable "virtual_machines" {
  description = "Virtual machines configuration"
  type        = any
  default     = {}
}

variable "vnets" {
  description = "Virtual networks configuration"
  type        = any
  default     = {}
}

variable "storage_accounts" {
  description = "Storage accounts configuration"
  type        = any
  default     = {}
}

variable "keyvaults" {
  description = "Key vaults configuration"
  type        = any
  default     = {}
}

variable "ip_addresses" {
  description = "IP addresses configuration"
  type        = any
  default     = {}
}

# Mock module for testing
module "example" {
  source = "./mock_module"
  
  global_settings = var.global_settings
  resource_groups = var.resource_groups
  virtual_machines = var.virtual_machines
  vnets = var.vnets
  storage_accounts = var.storage_accounts
  keyvaults = var.keyvaults
  ip_addresses = var.ip_addresses
}

# Outputs for testing
output "global_settings" {
  value = var.global_settings
}

output "resource_groups" {
  value = var.resource_groups
}

output "virtual_machines" {
  value = var.virtual_machines
}

output "vnets" {
  value = var.vnets
}

output "storage_accounts" {
  value = var.storage_accounts
}

output "keyvaults" {
  value = var.keyvaults
}

output "ip_addresses" {
  value = var.ip_addresses
}

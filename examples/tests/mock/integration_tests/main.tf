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

variable "network_security_groups" {
  description = "Network security groups configuration"
  type        = any
  default     = {}
}

variable "public_ip_addresses" {
  description = "Public IP addresses configuration"
  type        = any
  default     = {}
}

variable "network_interfaces" {
  description = "Network interfaces configuration"
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

variable "keyvault_secrets" {
  description = "Key vault secrets configuration"
  type        = any
  default     = {}
}

variable "managed_identities" {
  description = "Managed identities configuration"
  type        = any
  default     = {}
}

variable "mssql_servers" {
  description = "SQL servers configuration"
  type        = any
  default     = {}
}

variable "disk_encryption_sets" {
  description = "Disk encryption sets configuration"
  type        = any
  default     = {}
}

variable "private_endpoints" {
  description = "Private endpoints configuration"
  type        = any
  default     = {}
}

variable "aks_clusters" {
  description = "AKS clusters configuration"
  type        = any
  default     = {}
}

variable "load_balancers" {
  description = "Load balancers configuration"
  type        = any
  default     = {}
}

variable "virtual_machine_scale_sets" {
  description = "Virtual machine scale sets configuration"
  type        = any
  default     = {}
}

# Mock module for testing
module "example" {
  source = "./mock_module"
  
  global_settings = var.global_settings
  resource_groups = var.resource_groups
  
  # Compute resources
  virtual_machines = var.virtual_machines
  aks_clusters = var.aks_clusters
  load_balancers = var.load_balancers
  virtual_machine_scale_sets = var.virtual_machine_scale_sets
  
  # Networking resources
  vnets = var.vnets
  network_security_groups = var.network_security_groups
  public_ip_addresses = var.public_ip_addresses
  network_interfaces = var.network_interfaces
  private_endpoints = var.private_endpoints
  
  # Storage resources
  storage_accounts = var.storage_accounts
  mssql_servers = var.mssql_servers
  
  # Security resources
  keyvaults = var.keyvaults
  keyvault_secrets = var.keyvault_secrets
  managed_identities = var.managed_identities
  disk_encryption_sets = var.disk_encryption_sets
}

# Outputs for testing
output "global_settings" {
  value = var.global_settings
}

output "resource_groups" {
  value = var.resource_groups
}

output "compute" {
  value = {
    virtual_machines = var.virtual_machines
    aks_clusters = var.aks_clusters
    load_balancers = var.load_balancers
    virtual_machine_scale_sets = var.virtual_machine_scale_sets
  }
}

output "networking" {
  value = {
    vnets = var.vnets
    network_security_groups = var.network_security_groups
    public_ip_addresses = var.public_ip_addresses
    network_interfaces = var.network_interfaces
    private_endpoints = var.private_endpoints
  }
}

output "storage" {
  value = {
    storage_accounts = var.storage_accounts
    mssql_servers = var.mssql_servers
  }
}

output "security" {
  value = {
    keyvaults = var.keyvaults
    keyvault_secrets = var.keyvault_secrets
    managed_identities = var.managed_identities
    disk_encryption_sets = var.disk_encryption_sets
  }
}

variable "global_settings" {}
variable "resource_groups" {}
variable "networking" {}
variable "compute" {}
variable "storage" {}
variable "security" {}
variable "azuread" {}

# Global settings output
output "global_settings" {
  value = var.global_settings
}

# Resource groups output
output "resource_groups" {
  value = var.resource_groups
}

# Networking outputs
output "networking" {
  value = {
    vnets                   = lookup(var.networking, "vnets", {})
    network_security_groups = lookup(var.networking, "network_security_groups", {})
    public_ip_addresses     = lookup(var.networking, "public_ip_addresses", {})
    network_interfaces      = lookup(var.networking, "network_interfaces", {})
    application_gateways    = lookup(var.networking, "application_gateways", {})
    firewalls               = lookup(var.networking, "firewalls", {})
  }
}

# Compute outputs
output "compute" {
  value = {
    virtual_machines           = lookup(var.compute, "virtual_machines", {})
    virtual_machine_scale_sets = lookup(var.compute, "virtual_machine_scale_sets", {})
    aks_clusters               = lookup(var.compute, "aks_clusters", {})
    load_balancers             = lookup(var.compute, "load_balancers", {})
  }
}

# Storage outputs
output "storage" {
  value = {
    storage_accounts = lookup(var.storage, "storage_accounts", {})
    mssql_servers    = lookup(var.storage, "mssql_servers", {})
    cosmos_dbs       = lookup(var.storage, "cosmos_dbs", {})
    mysql_servers    = lookup(var.storage, "mysql_servers", {})
    postgresql_servers = lookup(var.storage, "postgresql_servers", {})
    synapse_workspaces = lookup(var.storage, "synapse_workspaces", {})
  }
}

# Security outputs
output "security" {
  value = {
    keyvaults            = lookup(var.security, "keyvaults", {})
    managed_identities   = lookup(var.security, "managed_identities", {})
    keyvault_secrets     = lookup(var.security, "keyvault_secrets", {})
    keyvault_keys        = lookup(var.security, "keyvault_keys", {})
    role_assignments     = lookup(var.security, "role_assignments", {})
    disk_encryption_sets = lookup(var.security, "disk_encryption_sets", {})
  }
}

# Azure AD outputs
output "azuread" {
  value = {
    azuread_applications       = lookup(var.azuread, "azuread_applications", {})
    azuread_service_principals = lookup(var.azuread, "azuread_service_principals", {})
    azuread_groups             = lookup(var.azuread, "azuread_groups", {})
    azuread_users              = lookup(var.azuread, "azuread_users", {})
    azuread_roles              = lookup(var.azuread, "azuread_roles", {})
  }
}

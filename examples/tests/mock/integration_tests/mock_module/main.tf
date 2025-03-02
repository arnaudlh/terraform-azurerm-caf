variable "global_settings" {}
variable "resource_groups" {}
variable "virtual_machines" {}
variable "vnets" {}
variable "network_security_groups" {}
variable "public_ip_addresses" {}
variable "network_interfaces" {}
variable "storage_accounts" {}
variable "keyvaults" {}
variable "keyvault_secrets" {}
variable "managed_identities" {}
variable "mssql_servers" {}
variable "disk_encryption_sets" {}
variable "private_endpoints" {}
variable "aks_clusters" {}
variable "load_balancers" {}
variable "virtual_machine_scale_sets" {}

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

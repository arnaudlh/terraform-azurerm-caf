variable "global_settings" {}
variable "resource_groups" {}
variable "virtual_machines" {}
variable "vnets" {}
variable "storage_accounts" {}
variable "keyvaults" {}
variable "ip_addresses" {}

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

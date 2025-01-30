output "id" {
  description = "The ID of the subscription Consumption Budget"
  value       = azurerm_consumption_budget_subscription.this.id
}

output "budget" {
  description = "The subscription Consumption Budget resource"
  value       = azurerm_consumption_budget_subscription.this
}

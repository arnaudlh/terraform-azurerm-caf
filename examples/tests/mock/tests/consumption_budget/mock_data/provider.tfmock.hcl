mock_provider "azurerm" {
  mock_resource "azurerm_consumption_budget_subscription" {
    defaults = {
      id              = "/subscriptions/00000000-0000-0000-0000-000000000000/providers/Microsoft.Consumption/budgets/test-budget"
      name            = "test-budget"
      subscription_id = "/subscriptions/00000000-0000-0000-0000-000000000000"
      amount         = 1000
      time_grain     = "Monthly"
      time_period = {
        start_date = "2024-01-01T00:00:00Z"
        end_date   = "2024-12-31T23:59:59Z"
      }
      notification = [{
        enabled        = true
        threshold      = 90.0
        operator       = "GreaterThan"
        threshold_type = "Actual"
        contact_emails = ["test@example.com"]
      }]
    }
  }
}

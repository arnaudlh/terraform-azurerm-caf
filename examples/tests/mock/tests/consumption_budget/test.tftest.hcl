mock "azurerm" {
  mock_data_file = "mock_data/mock_provider.tfmock.hcl"
}

run "verify_subscription_budget" {
  command = plan

  assert {
    condition     = azurerm_consumption_budget_subscription.test.amount == 1000
    error_message = "Budget amount not set correctly"
  }

  assert {
    condition     = azurerm_consumption_budget_subscription.test.notification[0].threshold == 90.0
    error_message = "Budget notification threshold not set correctly"
  }

  assert {
    condition     = azurerm_consumption_budget_subscription.test.notification[0].threshold_type == "Actual"
    error_message = "Budget notification threshold type not set correctly"
  }

  assert {
    condition     = azurerm_consumption_budget_subscription.test.time_grain == "Monthly"
    error_message = "Budget time grain not set correctly"
  }
}

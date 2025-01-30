provider "azurerm" {
  features {}
  skip_provider_registration = true
}

mock "azurerm" {
  mock_data_file = "mock_data/provider.tfmock.hcl"
}

run "verify_subscription_budget" {
  command = plan

  assert {
    condition     = module.subscription_budget.budget.amount == 1000
    error_message = "Budget amount not set correctly"
  }

  assert {
    condition     = module.subscription_budget.budget.notification[0].threshold == 90.0
    error_message = "Budget notification threshold not set correctly"
  }

  assert {
    condition     = module.subscription_budget.budget.notification[0].threshold_type == "Actual"
    error_message = "Budget notification threshold type not set correctly"
  }

  assert {
    condition     = module.subscription_budget.budget.time_grain == "Monthly"
    error_message = "Budget time grain not set correctly"
  }
}

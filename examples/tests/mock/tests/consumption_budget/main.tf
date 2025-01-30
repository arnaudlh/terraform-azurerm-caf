terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.16.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

module "subscription_budget" {
  source = "../../../../../modules/consumption_budget/subscription"

  client_config = {
    subscription_id = "/subscriptions/00000000-0000-0000-0000-000000000000"
  }
  settings = {
    name = "test-budget"
    amount = 1000
    time_grain = "Monthly"
    time_period = {
      start_date = "2024-01-01T00:00:00Z"
      end_date = "2024-12-31T23:59:59Z"
    }
    notifications = [
      {
        enabled = true
        threshold = 90.0
        operator = "GreaterThan"
        threshold_type = "Actual"
        contact_emails = ["test@example.com"]
      }
    ]
  }
}

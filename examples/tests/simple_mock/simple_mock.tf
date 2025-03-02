terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  use_msi                    = false
}

output "test_output" {
  value = "This is a test"
}

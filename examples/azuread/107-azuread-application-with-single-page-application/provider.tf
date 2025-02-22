terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
    }
  }
}

provider "azuread" {
  use_mock = true
  mock_data_path = "../../../examples/tests/mock_data/data.tfmock.hcl"
}

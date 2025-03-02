mock_provider "azurerm" {
  source = "../mock_data"
}

mock_provider "azuread" {
  source = "../mock_data"
}

run "test_resource_group" {
  command = plan

  assert {
    condition     = length(var.resource_groups) > 0
    error_message = "Resource groups variable should not be empty"
  }
  
  assert {
    condition     = var.resource_groups.test_rg.name == "test-resource-group"
    error_message = "Resource group name should be 'test-resource-group'"
  }
}

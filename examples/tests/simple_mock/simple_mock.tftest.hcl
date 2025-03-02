mock_provider "azurerm" {
  source = "../mock_data"
}

run "simple_mock_test" {
  command = plan

  assert {
    condition     = output.test_output == "This is a test"
    error_message = "Test output should match expected value"
  }
}

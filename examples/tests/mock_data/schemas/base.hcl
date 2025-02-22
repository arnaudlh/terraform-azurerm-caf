mock_data "base_resource" {
  defaults = {
    id                  = "/subscriptions/{subscription_id}/resourceGroups/{resource_group}/providers/Microsoft.{provider}/{resource_type}/{name}"
    name                = "mock-{resource_type}"
    location            = "eastus"
    resource_group_name = "mock-rg"
    tags = {
      environment = "test"
      purpose     = "mock"
    }
  }
}

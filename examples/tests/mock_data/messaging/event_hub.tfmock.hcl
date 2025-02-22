mock_data "azurerm_eventhub_namespace" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.EventHub/namespaces/mock-eventhub"
    name                = "mock-eventhub"
    location            = "eastus"
    resource_group_name = "mock-rg"
    sku                = "Standard"
    capacity           = 1
  }
}

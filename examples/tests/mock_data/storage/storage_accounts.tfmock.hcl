mock_data "azurerm_storage_account" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Storage/storageAccounts/mocksa"
    name                = "mocksa"
    location            = "eastus"
    resource_group_name = "mock-rg"
    account_tier        = "Standard"
    account_kind        = "StorageV2"
  }
}

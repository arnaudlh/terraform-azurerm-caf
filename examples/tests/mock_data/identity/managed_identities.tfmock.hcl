mock_data "azurerm_user_assigned_identity" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mock-identity"
    name                = "mock-identity"
    location            = "eastus"
    resource_group_name = "mock-rg"
    principal_id        = "00000000-0000-0000-0000-000000000002"
    client_id          = "00000000-0000-0000-0000-000000000003"
    tenant_id          = "00000000-0000-0000-0000-000000000004"
  }
}

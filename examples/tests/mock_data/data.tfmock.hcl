# Mock data for general Azure resources

mock_data "azurerm_subscription" {
  defaults = {
    subscription_id = "00000000-0000-0000-0000-000000000000"
    tenant_id       = "00000000-0000-0000-0000-000000000000"
    display_name    = "Mock Subscription"
    state           = "Enabled"
  }
}

mock_data "azurerm_client_config" {
  defaults = {
    tenant_id       = "00000000-0000-0000-0000-000000000000"
    subscription_id = "00000000-0000-0000-0000-000000000000"
    client_id       = "00000000-0000-0000-0000-000000000000"
    object_id       = "00000000-0000-0000-0000-000000000000"
  }
}

# Removed duplicate azuread_service_principal mock data

# Removed duplicate azurerm_role_definition mock data

mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

run "test_key_vault_creation" {
  command = plan

  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      kv_region1 = {
        name = "test-kv-rg"
      }
    }
    
    security = {
      keyvaults = {
        kv1 = {
          resource_group_key = "kv_region1"
          name               = "test-keyvault"
          sku_name           = "standard"
          creation_policies = {
            logged_in_user = {
              secret_permissions = ["Set", "Get", "List", "Delete", "Purge"]
              key_permissions    = ["Get", "List", "Update", "Create", "Delete"]
            }
          }
        }
      }
    }
  }

  assert {
    condition     = length(module.example.security.keyvaults) > 0
    error_message = "Key vault was not created"
  }
  
  assert {
    condition     = module.example.security.keyvaults.kv1.name == "test-keyvault"
    error_message = "Key vault name does not match expected value"
  }
}

run "test_managed_identity_creation" {
  command = plan

  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      identity_region1 = {
        name = "test-identity-rg"
      }
    }
    
    security = {
      managed_identities = {
        identity1 = {
          resource_group_key = "identity_region1"
          name               = "test-identity"
        }
      }
    }
  }

  assert {
    condition     = length(module.example.security.managed_identities) > 0
    error_message = "Managed identity was not created"
  }
  
  assert {
    condition     = module.example.security.managed_identities.identity1.name == "test-identity"
    error_message = "Managed identity name does not match expected value"
  }
}

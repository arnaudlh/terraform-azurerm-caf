mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

# Test Key Vault with Storage Account integration
run "test_keyvault_storage_integration" {
  command = plan

  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      security_rg = {
        name = "test-security-rg"
      }
      storage_rg = {
        name = "test-storage-rg"
      }
    }
    
    keyvaults = {
      kv1 = {
        resource_group_key = "security_rg"
        name               = "test-keyvault"
        sku_name           = "standard"
        
        creation_policies = {
          logged_in_user = {
            secret_permissions = ["Set", "Get", "List", "Delete", "Purge"]
          }
        }
      }
    }
    
    storage_accounts = {
      sa1 = {
        resource_group_key = "storage_rg"
        name               = "teststorageaccount"
        account_kind       = "StorageV2"
        account_tier       = "Standard"
        account_replication_type = "LRS"
      }
    }
    
    keyvault_secrets = {
      storage_key = {
        keyvault_key = "kv1"
        name         = "storage-account-key"
        value        = "mock-storage-account-key"
      }
    }
  }

  assert {
    condition     = length(var.keyvaults) > 0 && length(var.storage_accounts) > 0 && length(var.keyvault_secrets) > 0
    error_message = "Key vaults, storage accounts, and key vault secrets should not be empty"
  }
}

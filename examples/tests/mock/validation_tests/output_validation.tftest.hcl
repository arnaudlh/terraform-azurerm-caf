mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

# Test key vault output structure
run "test_keyvault_output_structure" {
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
    }
    
    keyvaults = {
      kv1 = {
        resource_group_key = "security_rg"
        name               = "test-keyvault"
        sku_name           = "standard"
      }
    }
  }

  assert {
    condition     = length(var.keyvaults) > 0
    error_message = "Key vaults should not be empty"
  }
  
  assert {
    condition     = var.keyvaults.kv1.name == "test-keyvault"
    error_message = "Key vault name does not match expected value"
  }
  
  assert {
    condition     = var.keyvaults.kv1.sku_name == "standard"
    error_message = "Key vault SKU name does not match expected value"
  }
}

# Test storage account output structure
run "test_storage_account_output_structure" {
  command = plan

  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      storage_rg = {
        name = "test-storage-rg"
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
  }

  assert {
    condition     = length(var.storage_accounts) > 0
    error_message = "Storage accounts should not be empty"
  }
  
  assert {
    condition     = var.storage_accounts.sa1.name == "teststorageaccount"
    error_message = "Storage account name does not match expected value"
  }
  
  assert {
    condition     = var.storage_accounts.sa1.account_kind == "StorageV2"
    error_message = "Storage account kind does not match expected value"
  }
}

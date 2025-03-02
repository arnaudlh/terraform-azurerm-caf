mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

# Test Key Vault creation
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
  
  assert {
    condition     = length(module.example.keyvaults) > 0
    error_message = "Key Vault was not created"
  }
}

# Test Key Vault secret creation
run "test_key_vault_secret_creation" {
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
    
    keyvaults = {
      kv1 = {
        resource_group_key = "kv_region1"
        name               = "test-keyvault"
        sku_name           = "standard"
        
        creation_policies = {
          logged_in_user = {
            secret_permissions = ["Set", "Get", "List", "Delete", "Purge"]
          }
        }
      }
    }
    
    keyvault_secrets = {
      secret1 = {
        keyvault_key = "kv1"
        name         = "test-secret"
        value        = "test-value"
      }
    }
  }
  
  assert {
    condition     = length(module.example.keyvault_secrets) > 0
    error_message = "Key Vault secret was not created"
  }
}

# Test Key Vault key creation
run "test_key_vault_key_creation" {
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
    
    keyvaults = {
      kv1 = {
        resource_group_key = "kv_region1"
        name               = "test-keyvault"
        sku_name           = "standard"
        
        creation_policies = {
          logged_in_user = {
            key_permissions = ["Get", "List", "Update", "Create", "Delete"]
          }
        }
      }
    }
    
    keyvault_keys = {
      key1 = {
        keyvault_key = "kv1"
        name         = "test-key"
        key_type     = "RSA"
        key_size     = 2048
        key_opts     = ["decrypt", "encrypt", "sign", "verify"]
      }
    }
  }
  
  assert {
    condition     = length(module.example.keyvault_keys) > 0
    error_message = "Key Vault key was not created"
  }
}

# Test managed identity creation
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
    
    managed_identities = {
      identity1 = {
        resource_group_key = "identity_region1"
        name               = "test-identity"
      }
    }
  }
  
  assert {
    condition     = length(module.example.managed_identities) > 0
    error_message = "Managed identity was not created"
  }
}

# Test role assignment creation
run "test_role_assignment_creation" {
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
    
    managed_identities = {
      identity1 = {
        resource_group_key = "identity_region1"
        name               = "test-identity"
      }
    }
    
    role_mapping = {
      built_in_role_mapping = {
        resource_groups = {
          identity_region1 = {
            "Contributor" = {
              managed_identities = {
                keys = ["identity1"]
              }
            }
          }
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.role_assignments) > 0
    error_message = "Role assignment was not created"
  }
}

# Test disk encryption set creation
run "test_disk_encryption_set_creation" {
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
    
    keyvaults = {
      kv1 = {
        resource_group_key = "kv_region1"
        name               = "test-keyvault"
        sku_name           = "standard"
        
        creation_policies = {
          logged_in_user = {
            key_permissions = ["Get", "List", "Update", "Create", "Delete", "GetRotationPolicy", "SetRotationPolicy"]
          }
        }
      }
    }
    
    keyvault_keys = {
      key1 = {
        keyvault_key = "kv1"
        name         = "test-key"
        key_type     = "RSA"
        key_size     = 2048
        key_opts     = ["decrypt", "encrypt", "sign", "verify", "wrapKey", "unwrapKey"]
      }
    }
    
    disk_encryption_sets = {
      des1 = {
        resource_group_key = "kv_region1"
        name               = "test-des"
        key_vault_key_key  = "key1"
        
        identity = {
          type = "SystemAssigned"
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.disk_encryption_sets) > 0
    error_message = "Disk encryption set was not created"
  }
}

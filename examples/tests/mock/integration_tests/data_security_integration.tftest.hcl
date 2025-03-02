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
        value        = "mock-storage-key"
      }
    }
  }
  
  assert {
    condition     = length(module.example.keyvaults) > 0 && length(module.example.storage_accounts) > 0 && length(module.example.keyvault_secrets) > 0
    error_message = "Key Vault with Storage Account integration was not created properly"
  }
}

# Test Managed Identity with Key Vault integration
run "test_managed_identity_keyvault_integration" {
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
    
    managed_identities = {
      identity1 = {
        resource_group_key = "security_rg"
        name               = "test-identity"
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
            key_permissions    = ["Get", "List", "Update", "Create", "Delete"]
          }
        }
        
        # Grant access to the managed identity
        access_policies = {
          identity1 = {
            managed_identity_key = "identity1"
            secret_permissions   = ["Get", "List"]
            key_permissions      = ["Get", "List"]
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
    condition     = length(module.example.managed_identities) > 0 && length(module.example.keyvaults) > 0
    error_message = "Managed Identity with Key Vault integration was not created properly"
  }
}

# Test SQL Server with Key Vault integration
run "test_sql_server_keyvault_integration" {
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
      sql_rg = {
        name = "test-sql-rg"
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
    
    keyvault_secrets = {
      sql_admin = {
        keyvault_key = "kv1"
        name         = "sql-admin-password"
        value        = "ComplexP@ssw0rd!"
      }
    }
    
    mssql_servers = {
      sql1 = {
        resource_group_key = "sql_rg"
        name               = "test-sql-server"
        version            = "12.0"
        administrator_login = "sqladmin"
        # Reference the password from Key Vault
        administrator_login_password = "ComplexP@ssw0rd!"
        connection_policy = "Default"
        minimum_tls_version = "1.2"
      }
    }
  }
  
  assert {
    condition     = length(module.example.keyvaults) > 0 && length(module.example.mssql_servers) > 0
    error_message = "SQL Server with Key Vault integration was not created properly"
  }
}

# Test VM with Disk Encryption Set integration
run "test_vm_disk_encryption_integration" {
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
      compute_rg = {
        name = "test-compute-rg"
      }
    }
    
    keyvaults = {
      kv1 = {
        resource_group_key = "security_rg"
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
        resource_group_key = "security_rg"
        name               = "test-des"
        key_vault_key_key  = "key1"
        
        identity = {
          type = "SystemAssigned"
        }
      }
    }
    
    networking = {
      vnets = {
        vnet1 = {
          resource_group_key = "compute_rg"
          vnet = {
            name          = "test-vnet"
            address_space = ["10.0.0.0/16"]
          }
          subnets = {
            subnet1 = {
              name           = "test-subnet"
              address_prefix = "10.0.1.0/24"
            }
          }
        }
      }
      
      network_interfaces = {
        nic1 = {
          resource_group_key = "compute_rg"
          name               = "test-vm-nic"
          
          ip_configurations = {
            primary = {
              name                          = "primary"
              subnet_key                    = "subnet1"
              vnet_key                      = "vnet1"
              private_ip_address_allocation = "Dynamic"
            }
          }
        }
      }
    }
    
    compute = {
      virtual_machines = {
        vm1 = {
          resource_group_key = "compute_rg"
          provision_vm_agent = true
          os_type            = "linux"
          
          # OS disk with encryption
          os_disk = {
            name                 = "vm1-os"
            caching              = "ReadWrite"
            storage_account_type = "Standard_LRS"
            disk_encryption_set_key = "des1"
          }
          
          # Source image reference
          source_image_reference = {
            publisher = "Canonical"
            offer     = "UbuntuServer"
            sku       = "18.04-LTS"
            version   = "latest"
          }
          
          # Admin credentials
          admin_username = "adminuser"
          
          # Network interfaces
          network_interfaces = {
            nic1 = {
              network_interface_key = "nic1"
            }
          }
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.compute.virtual_machines) > 0 && length(module.example.disk_encryption_sets) > 0
    error_message = "VM with Disk Encryption Set integration was not created properly"
  }
}

# Test Storage Account with Private Endpoint integration
run "test_storage_private_endpoint_integration" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      network_rg = {
        name = "test-network-rg"
      }
      storage_rg = {
        name = "test-storage-rg"
      }
    }
    
    networking = {
      vnets = {
        vnet1 = {
          resource_group_key = "network_rg"
          vnet = {
            name          = "test-vnet"
            address_space = ["10.0.0.0/16"]
          }
          subnets = {
            subnet1 = {
              name           = "test-subnet"
              address_prefix = "10.0.1.0/24"
            }
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
        
        # Enable private endpoint support
        private_endpoints = {
          pe1 = {
            name               = "storage-pe"
            resource_group_key = "storage_rg"
            vnet_key           = "vnet1"
            subnet_key         = "subnet1"
            private_service_connection = {
              name                 = "storage-psc"
              is_manual_connection = false
              subresource_names    = ["blob"]
            }
          }
        }
      }
    }
    
    private_dns = {
      zones = {
        dns1 = {
          name               = "privatelink.blob.core.windows.net"
          resource_group_key = "network_rg"
          
          vnet_links = {
            link1 = {
              name     = "vnet-link"
              vnet_key = "vnet1"
            }
          }
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.storage_accounts) > 0 && length(module.example.networking.private_endpoints) > 0
    error_message = "Storage Account with Private Endpoint integration was not created properly"
  }
}

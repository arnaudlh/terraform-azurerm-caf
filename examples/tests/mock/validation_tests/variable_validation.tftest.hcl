mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

# Test invalid region handling
run "test_invalid_region" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "invalid_region"
      regions = {
        invalid_region = "not_a_real_region"
      }
    }
    
    resource_groups = {
      rg1 = {
        name = "test-rg"
      }
    }
  }
  
  expect_failures = [
    # Expect failure due to invalid region
    "Invalid Azure region",
  ]
}

# Test missing required variables
run "test_missing_required_variables" {
  command = plan
  
  # Deliberately omit global_settings
  variables {
    resource_groups = {
      rg1 = {
        name = "test-rg"
      }
    }
  }
  
  expect_failures = [
    # Expect failure due to missing required variable
    "Missing required variable",
    "global_settings",
  ]
}

# Test invalid resource group name format
run "test_invalid_resource_group_name" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      rg1 = {
        name = "Invalid_RG_Name_With_Special_Chars!@#"
      }
    }
  }
  
  expect_failures = [
    # Expect failure due to invalid resource group name
    "Resource group name validation failed",
  ]
}

# Test invalid subnet address space
run "test_invalid_subnet_address_space" {
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
              # Invalid subnet address space (outside of VNet range)
              address_prefix = "192.168.1.0/24"
            }
          }
        }
      }
    }
  }
  
  expect_failures = [
    # Expect failure due to invalid subnet address space
    "Subnet address prefix must be within the VNet address space",
  ]
}

# Test invalid VM size
run "test_invalid_vm_size" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      vm_rg = {
        name = "test-vm-rg"
      }
    }
    
    compute = {
      virtual_machines = {
        vm1 = {
          resource_group_key = "vm_rg"
          provision_vm_agent = true
          os_type            = "linux"
          # Invalid VM size
          size               = "NonExistentSize"
          
          # OS disk
          os_disk = {
            name                 = "vm1-os"
            caching              = "ReadWrite"
            storage_account_type = "Standard_LRS"
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
        }
      }
    }
  }
  
  expect_failures = [
    # Expect failure due to invalid VM size
    "Invalid virtual machine size",
  ]
}

# Test invalid storage account name
run "test_invalid_storage_account_name" {
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
        # Invalid storage account name (too long)
        name               = "thisstorageaccountnameistoolongandwillcauseanerror"
        account_kind       = "StorageV2"
        account_tier       = "Standard"
        account_replication_type = "LRS"
      }
    }
  }
  
  expect_failures = [
    # Expect failure due to invalid storage account name
    "Storage account name validation failed",
  ]
}

# Test invalid key vault name
run "test_invalid_key_vault_name" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      kv_rg = {
        name = "test-kv-rg"
      }
    }
    
    keyvaults = {
      kv1 = {
        resource_group_key = "kv_rg"
        # Invalid key vault name (contains uppercase)
        name               = "TestKeyVault"
        sku_name           = "standard"
      }
    }
  }
  
  expect_failures = [
    # Expect failure due to invalid key vault name
    "Key vault name validation failed",
  ]
}

# Test invalid IP address format
run "test_invalid_ip_address_format" {
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
    }
    
    networking = {
      network_security_groups = {
        nsg1 = {
          resource_group_key = "network_rg"
          name               = "test-nsg"
          security_rules = {
            rule1 = {
              name                       = "test-rule"
              priority                   = 100
              direction                  = "Inbound"
              access                     = "Allow"
              protocol                   = "Tcp"
              source_port_range          = "*"
              destination_port_range     = "22"
              # Invalid IP address format
              source_address_prefix      = "300.300.300.300"
              destination_address_prefix = "*"
            }
          }
        }
      }
    }
  }
  
  expect_failures = [
    # Expect failure due to invalid IP address format
    "Invalid IP address format",
  ]
}

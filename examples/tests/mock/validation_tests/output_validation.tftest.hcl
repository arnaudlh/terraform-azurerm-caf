mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

# Test resource group output structure
run "test_resource_group_output_structure" {
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
        name = "test-rg"
      }
    }
  }
  
  assert {
    condition     = can(module.example.resource_groups)
    error_message = "Resource groups output is missing or has incorrect structure"
  }
  
  assert {
    condition     = can(module.example.resource_groups.rg1)
    error_message = "Resource group 'rg1' is missing from outputs"
  }
  
  assert {
    condition     = can(module.example.resource_groups.rg1.id) && can(module.example.resource_groups.rg1.name)
    error_message = "Resource group output is missing required attributes (id, name)"
  }
}

# Test virtual network output structure
run "test_vnet_output_structure" {
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
              address_prefix = "10.0.1.0/24"
            }
          }
        }
      }
    }
  }
  
  assert {
    condition     = can(module.example.networking.vnets)
    error_message = "Virtual networks output is missing or has incorrect structure"
  }
  
  assert {
    condition     = can(module.example.networking.vnets.vnet1)
    error_message = "Virtual network 'vnet1' is missing from outputs"
  }
  
  assert {
    condition     = can(module.example.networking.vnets.vnet1.id) && can(module.example.networking.vnets.vnet1.name) && can(module.example.networking.vnets.vnet1.subnets)
    error_message = "Virtual network output is missing required attributes (id, name, subnets)"
  }
  
  assert {
    condition     = can(module.example.networking.vnets.vnet1.subnets.subnet1)
    error_message = "Subnet 'subnet1' is missing from virtual network outputs"
  }
}

# Test virtual machine output structure
run "test_vm_output_structure" {
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
  
  assert {
    condition     = can(module.example.compute.virtual_machines)
    error_message = "Virtual machines output is missing or has incorrect structure"
  }
  
  assert {
    condition     = can(module.example.compute.virtual_machines.vm1)
    error_message = "Virtual machine 'vm1' is missing from outputs"
  }
  
  assert {
    condition     = can(module.example.compute.virtual_machines.vm1.id) && can(module.example.compute.virtual_machines.vm1.name) && can(module.example.compute.virtual_machines.vm1.resource_group_name)
    error_message = "Virtual machine output is missing required attributes (id, name, resource_group_name)"
  }
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
      kv_rg = {
        name = "test-kv-rg"
      }
    }
    
    keyvaults = {
      kv1 = {
        resource_group_key = "kv_rg"
        name               = "test-keyvault"
        sku_name           = "standard"
        
        creation_policies = {
          logged_in_user = {
            secret_permissions = ["Set", "Get", "List", "Delete", "Purge"]
          }
        }
      }
    }
  }
  
  assert {
    condition     = can(module.example.keyvaults)
    error_message = "Key vaults output is missing or has incorrect structure"
  }
  
  assert {
    condition     = can(module.example.keyvaults.kv1)
    error_message = "Key vault 'kv1' is missing from outputs"
  }
  
  assert {
    condition     = can(module.example.keyvaults.kv1.id) && can(module.example.keyvaults.kv1.name) && can(module.example.keyvaults.kv1.vault_uri)
    error_message = "Key vault output is missing required attributes (id, name, vault_uri)"
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
    condition     = can(module.example.storage_accounts)
    error_message = "Storage accounts output is missing or has incorrect structure"
  }
  
  assert {
    condition     = can(module.example.storage_accounts.sa1)
    error_message = "Storage account 'sa1' is missing from outputs"
  }
  
  assert {
    condition     = can(module.example.storage_accounts.sa1.id) && can(module.example.storage_accounts.sa1.name) && can(module.example.storage_accounts.sa1.primary_blob_endpoint)
    error_message = "Storage account output is missing required attributes (id, name, primary_blob_endpoint)"
  }
}

# Test AKS cluster output structure
run "test_aks_output_structure" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      aks_rg = {
        name = "test-aks-rg"
      }
    }
    
    compute = {
      aks_clusters = {
        cluster1 = {
          resource_group_key = "aks_rg"
          name               = "test-aks"
          dns_prefix         = "testaks"
          
          default_node_pool = {
            name                  = "default"
            vm_size               = "Standard_DS2_v2"
            enable_auto_scaling   = false
            node_count            = 1
            only_critical_addons_enabled = true
          }
          
          identity = {
            type = "SystemAssigned"
          }
          
          network_profile = {
            network_plugin    = "kubenet"
            load_balancer_sku = "standard"
          }
        }
      }
    }
  }
  
  assert {
    condition     = can(module.example.compute.aks_clusters)
    error_message = "AKS clusters output is missing or has incorrect structure"
  }
  
  assert {
    condition     = can(module.example.compute.aks_clusters.cluster1)
    error_message = "AKS cluster 'cluster1' is missing from outputs"
  }
  
  assert {
    condition     = can(module.example.compute.aks_clusters.cluster1.id) && can(module.example.compute.aks_clusters.cluster1.name) && can(module.example.compute.aks_clusters.cluster1.kube_config)
    error_message = "AKS cluster output is missing required attributes (id, name, kube_config)"
  }
}

# Test SQL server output structure
run "test_sql_server_output_structure" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      sql_rg = {
        name = "test-sql-rg"
      }
    }
    
    mssql_servers = {
      sql1 = {
        resource_group_key = "sql_rg"
        name               = "test-sql-server"
        version            = "12.0"
        administrator_login = "sqladmin"
        administrator_login_password = "ComplexP@ssw0rd!"
        connection_policy = "Default"
        minimum_tls_version = "1.2"
      }
    }
  }
  
  assert {
    condition     = can(module.example.mssql_servers)
    error_message = "SQL servers output is missing or has incorrect structure"
  }
  
  assert {
    condition     = can(module.example.mssql_servers.sql1)
    error_message = "SQL server 'sql1' is missing from outputs"
  }
  
  assert {
    condition     = can(module.example.mssql_servers.sql1.id) && can(module.example.mssql_servers.sql1.name) && can(module.example.mssql_servers.sql1.fully_qualified_domain_name)
    error_message = "SQL server output is missing required attributes (id, name, fully_qualified_domain_name)"
  }
}

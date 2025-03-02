# Common test configurations and helper functions for CAF module testing
# These helpers simplify test creation and reduce duplication across test files

# Standard global settings configuration used across tests
locals {
  standard_global_settings = {
    default_region = "region1"
    regions = {
      region1 = "eastus"
      region2 = "westus"
      region3 = "centralus"
    }
    random_length = 5
    prefix        = "caftest"
  }
  
  # Standard resource group configurations
  standard_resource_groups = {
    test_rg = {
      name = "test-resource-group"
    }
    network_rg = {
      name = "test-network-rg"
    }
    compute_rg = {
      name = "test-compute-rg"
    }
    storage_rg = {
      name = "test-storage-rg"
    }
    security_rg = {
      name = "test-security-rg"
    }
    database_rg = {
      name = "test-database-rg"
    }
  }
  
  # Standard networking configurations
  standard_networking = {
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
          subnet2 = {
            name           = "test-subnet2"
            address_prefix = "10.0.2.0/24"
          }
          AzureFirewallSubnet = {
            name           = "AzureFirewallSubnet"
            address_prefix = "10.0.3.0/24"
          }
          GatewaySubnet = {
            name           = "GatewaySubnet"
            address_prefix = "10.0.4.0/24"
          }
        }
      }
    }
    
    network_security_groups = {
      nsg1 = {
        resource_group_key = "network_rg"
        name               = "test-nsg"
        security_rules = {
          ssh = {
            name                       = "ssh-rule"
            priority                   = 100
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "22"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
          }
          http = {
            name                       = "http-rule"
            priority                   = 110
            direction                  = "Inbound"
            access                     = "Allow"
            protocol                   = "Tcp"
            source_port_range          = "*"
            destination_port_range     = "80"
            source_address_prefix      = "*"
            destination_address_prefix = "*"
          }
        }
      }
    }
    
    public_ip_addresses = {
      pip1 = {
        resource_group_key = "network_rg"
        name               = "test-pip"
        allocation_method  = "Static"
        sku                = "Standard"
        ip_version         = "IPv4"
      }
    }
  }
  
  # Standard compute configurations
  standard_compute = {
    virtual_machines = {
      vm1 = {
        resource_group_key = "compute_rg"
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
    
    aks_clusters = {
      cluster1 = {
        resource_group_key = "compute_rg"
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
  
  # Standard storage configurations
  standard_storage = {
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
  
  # Standard security configurations
  standard_security = {
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
      }
    }
    
    managed_identities = {
      identity1 = {
        resource_group_key = "security_rg"
        name               = "test-identity"
      }
    }
  }
  
  # Standard database configurations
  standard_database = {
    mssql_servers = {
      sql1 = {
        resource_group_key = "database_rg"
        name               = "test-sql-server"
        version            = "12.0"
        administrator_login = "sqladmin"
        administrator_login_password = "ComplexP@ssw0rd!"
        connection_policy = "Default"
        minimum_tls_version = "1.2"
      }
    }
    
    cosmos_dbs = {
      cosmos1 = {
        resource_group_key = "database_rg"
        name               = "test-cosmos-account"
        offer_type         = "Standard"
        kind               = "GlobalDocumentDB"
        
        consistency_policy = {
          consistency_level = "Session"
        }
        
        geo_locations = {
          region1 = {
            failover_priority = 0
          }
        }
      }
    }
  }
}

# Helper function to merge standard configurations with test-specific configurations
# This allows tests to override specific values while inheriting the rest
locals {
  merge_configurations = {
    global_settings = local.standard_global_settings
    resource_groups = local.standard_resource_groups
    networking      = local.standard_networking
    compute         = local.standard_compute
    storage         = local.standard_storage
    security        = local.standard_security
    database        = local.standard_database
  }
}

# Common assertion functions
locals {
  # Check if a resource exists in the output
  resource_exists = {
    # Example: local.resource_exists.in_map(module.example.resource_groups, "rg1")
    in_map = function(map, key) {
      can(map[key])
    }
    
    # Example: local.resource_exists.with_attribute(module.example.resource_groups.rg1, "id")
    with_attribute = function(resource, attr) {
      can(resource[attr])
    }
  }
}

# Common test data
locals {
  test_tags = {
    environment = "test"
    application = "caf-module-test"
    owner       = "terraform-test"
  }
  
  test_locations = {
    primary   = "eastus"
    secondary = "westus"
    tertiary  = "centralus"
  }
}

mock_provider "azurerm" {
  source = "../../../mock_data"
}

mock_provider "azuread" {
  source = "../../../mock_data"
}

# Test virtual machine creation
run "test_virtual_machine_creation" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      vm_region1 = {
        name = "test-vm-rg"
      }
    }
    
    compute = {
      virtual_machines = {
        vm1 = {
          resource_group_key = "vm_region1"
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
          # Network interfaces
          network_interfaces = {
            nic1 = {
              name               = "vm1-nic"
              enable_ip_forwarding = false
            }
          }
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.compute.virtual_machines) > 0
    error_message = "Virtual machine was not created"
  }
}

# Test AKS cluster creation
run "test_aks_creation" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      aks_region1 = {
        name = "test-aks-rg"
      }
    }
    
    compute = {
      aks_clusters = {
        cluster1 = {
          resource_group_key = "aks_region1"
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
    condition     = length(module.example.compute.aks_clusters) > 0
    error_message = "AKS cluster was not created"
  }
}

# Test virtual machine scale set creation
run "test_vmss_creation" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      vmss_region1 = {
        name = "test-vmss-rg"
      }
    }
    
    compute = {
      virtual_machine_scale_sets = {
        vmss1 = {
          resource_group_key = "vmss_region1"
          os_type            = "linux"
          instances          = 2
          
          # OS disk
          os_disk = {
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
          
          # SKU
          sku_name = "Standard_DS1_v2"
          
          # Network interfaces
          network_interfaces = {
            nic1 = {
              name               = "vmss1-nic"
              primary            = true
              enable_ip_forwarding = false
            }
          }
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.compute.virtual_machine_scale_sets) > 0
    error_message = "Virtual machine scale set was not created"
  }
}

# Test availability set creation
run "test_availability_set_creation" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      avset_region1 = {
        name = "test-avset-rg"
      }
    }
    
    compute = {
      availability_sets = {
        avset1 = {
          resource_group_key = "avset_region1"
          name               = "test-avset"
          platform_fault_domain_count = 2
          platform_update_domain_count = 5
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.compute.availability_sets) > 0
    error_message = "Availability set was not created"
  }
}

# Test container registry creation
run "test_container_registry_creation" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      acr_region1 = {
        name = "test-acr-rg"
      }
    }
    
    compute = {
      container_registry = {
        acr1 = {
          resource_group_key = "acr_region1"
          name               = "testacr"
          sku                = "Standard"
          admin_enabled      = false
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.compute.container_registry) > 0
    error_message = "Container registry was not created"
  }
}

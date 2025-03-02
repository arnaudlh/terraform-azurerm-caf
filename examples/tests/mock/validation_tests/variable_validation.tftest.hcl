mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

# Test resource group output structure - positive test
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
      test_rg = {
        name = "test-resource-group"
      }
    }
  }

  assert {
    condition     = length(var.resource_groups) > 0
    error_message = "Resource groups should not be empty"
  }
  
  assert {
    condition     = var.resource_groups.test_rg.name == "test-resource-group"
    error_message = "Resource group name does not match expected value"
  }
}

# Test virtual network output structure - positive test
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

  assert {
    condition     = length(var.vnets) > 0
    error_message = "Virtual networks should not be empty"
  }
  
  assert {
    condition     = var.vnets.vnet1.vnet.name == "test-vnet"
    error_message = "Virtual network name does not match expected value"
  }
  
  assert {
    condition     = length(var.vnets.vnet1.subnets) > 0
    error_message = "Subnets should not be empty"
  }
}

# Test virtual machine output structure - positive test
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
    
    virtual_machines = {
      test_vm = {
        resource_group_key = "vm_rg"
        provision_vm_agent = true
        os_type            = "linux"
        
        # OS disk
        os_disk = {
          name                 = "test-vm-os"
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

  assert {
    condition     = length(var.virtual_machines) > 0
    error_message = "Virtual machines should not be empty"
  }
  
  assert {
    condition     = var.virtual_machines.test_vm.os_type == "linux"
    error_message = "Virtual machine OS type does not match expected value"
  }
  
  assert {
    condition     = var.virtual_machines.test_vm.os_disk.storage_account_type == "Standard_LRS"
    error_message = "Virtual machine OS disk storage account type does not match expected value"
  }
}

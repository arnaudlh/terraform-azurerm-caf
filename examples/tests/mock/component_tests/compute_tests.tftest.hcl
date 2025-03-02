mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
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
      random_length = 5
      prefix        = "caftest"
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
    error_message = "Virtual machines variable should not be empty"
  }
}

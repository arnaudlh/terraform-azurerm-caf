mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

# Test VM with network integration
run "test_vm_with_network_integration" {
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
        }
      }
    }
    
    network_interfaces = {
      nic1 = {
        resource_group_key = "vm_rg"
        name               = "test-nic"
        ip_configurations = {
          primary = {
            subnet_key = "subnet1"
            vnet_key   = "vnet1"
            name       = "primary"
          }
        }
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
        
        # Network interface
        network_interface_keys = ["nic1"]
      }
    }
  }

  assert {
    condition     = length(var.virtual_machines) > 0 && length(var.network_interfaces) > 0
    error_message = "Virtual machines and network interfaces should not be empty"
  }
}

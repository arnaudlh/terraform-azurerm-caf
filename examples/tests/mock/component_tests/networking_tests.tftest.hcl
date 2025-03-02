mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

run "test_virtual_network_creation" {
  command = plan

  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      network_region1 = {
        name = "test-network-rg"
      }
    }
    
    networking = {
      vnets = {
        vnet1 = {
          resource_group_key = "network_region1"
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
    condition     = length(module.example.networking.vnets) > 0
    error_message = "Virtual network was not created"
  }
  
  assert {
    condition     = module.example.networking.vnets.vnet1.vnet.name == "test-vnet"
    error_message = "Virtual network name does not match expected value"
  }
  
  assert {
    condition     = length(module.example.networking.vnets.vnet1.subnets) > 0
    error_message = "Subnet was not created"
  }
}

run "test_network_security_group_creation" {
  command = plan

  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      network_region1 = {
        name = "test-network-rg"
      }
    }
    
    networking = {
      network_security_groups = {
        nsg1 = {
          resource_group_key = "network_region1"
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
              source_address_prefix      = "*"
              destination_address_prefix = "*"
            }
          }
        }
      }
    }
  }

  assert {
    condition     = length(module.example.networking.network_security_groups) > 0
    error_message = "Network security group was not created"
  }
  
  assert {
    condition     = module.example.networking.network_security_groups.nsg1.name == "test-nsg"
    error_message = "Network security group name does not match expected value"
  }
}

run "test_public_ip_creation" {
  command = plan

  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      network_region1 = {
        name = "test-network-rg"
      }
    }
    
    networking = {
      public_ip_addresses = {
        pip1 = {
          resource_group_key = "network_region1"
          name               = "test-pip"
          allocation_method  = "Static"
          sku                = "Standard"
          ip_version         = "IPv4"
        }
      }
    }
  }

  assert {
    condition     = length(module.example.networking.public_ip_addresses) > 0
    error_message = "Public IP address was not created"
  }
  
  assert {
    condition     = module.example.networking.public_ip_addresses.pip1.name == "test-pip"
    error_message = "Public IP address name does not match expected value"
  }
}

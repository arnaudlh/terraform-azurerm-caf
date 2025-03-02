mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

# Test virtual network creation
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
}

# Test network security group creation
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
}

# Test public IP address creation
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
}

# Test application gateway creation
run "test_application_gateway_creation" {
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
      
      public_ip_addresses = {
        pip1 = {
          resource_group_key = "network_region1"
          name               = "test-pip"
          allocation_method  = "Static"
          sku                = "Standard"
          ip_version         = "IPv4"
        }
      }
      
      application_gateways = {
        appgw1 = {
          resource_group_key = "network_region1"
          name               = "test-appgw"
          sku_name           = "Standard_v2"
          sku_tier           = "Standard_v2"
          capacity = {
            autoscale = {
              minimum_scale_unit = 1
              maximum_scale_unit = 2
            }
          }
          
          frontend_ip_configurations = {
            public = {
              name          = "public"
              public_ip_key = "pip1"
            }
          }
          
          frontend_ports = {
            80 = {
              name = "http"
              port = 80
            }
          }
          
          backend_address_pools = {
            pool1 = {
              name = "backend-pool"
            }
          }
          
          backend_http_settings = {
            http1 = {
              name                  = "http-backend-setting"
              port                  = 80
              protocol              = "Http"
              cookie_based_affinity = "Disabled"
            }
          }
          
          http_listeners = {
            listener1 = {
              name                           = "http-listener"
              frontend_ip_configuration_name = "public"
              frontend_port_name             = "80"
              protocol                       = "Http"
            }
          }
          
          request_routing_rules = {
            rule1 = {
              name                       = "rule-http"
              rule_type                  = "Basic"
              http_listener_name         = "listener1"
              backend_address_pool_name  = "pool1"
              backend_http_settings_name = "http1"
              priority                   = 100
            }
          }
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.networking.application_gateways) > 0
    error_message = "Application gateway was not created"
  }
}

# Test firewall creation
run "test_firewall_creation" {
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
            AzureFirewallSubnet = {
              name           = "AzureFirewallSubnet"
              address_prefix = "10.0.1.0/24"
            }
          }
        }
      }
      
      public_ip_addresses = {
        pip1 = {
          resource_group_key = "network_region1"
          name               = "test-fw-pip"
          allocation_method  = "Static"
          sku                = "Standard"
          ip_version         = "IPv4"
        }
      }
      
      azurerm_firewalls = {
        fw1 = {
          resource_group_key = "network_region1"
          name               = "test-fw"
          vnet_key           = "vnet1"
          sku_name           = "AZFW_VNet"
          sku_tier           = "Standard"
          
          ip_configuration = {
            config1 = {
              name                 = "configuration"
              public_ip_address_key = "pip1"
              subnet_key           = "AzureFirewallSubnet"
            }
          }
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.networking.azurerm_firewalls) > 0
    error_message = "Firewall was not created"
  }
}

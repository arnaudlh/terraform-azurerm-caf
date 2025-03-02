mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

# Test VM with networking components integration
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
      network_rg = {
        name = "test-network-rg"
      }
      vm_rg = {
        name = "test-vm-rg"
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
      
      network_security_groups = {
        nsg1 = {
          resource_group_key = "network_rg"
          name               = "test-vm-nsg"
          
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
          resource_group_key = "network_rg"
          name               = "test-vm-nic"
          
          ip_configurations = {
            primary = {
              name                          = "primary"
              subnet_key                    = "subnet1"
              vnet_key                      = "vnet1"
              private_ip_address_allocation = "Dynamic"
            }
          }
          
          network_security_group_key = "nsg1"
        }
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
    condition     = length(module.example.compute.virtual_machines) > 0 && length(module.example.networking.network_interfaces) > 0
    error_message = "VM with networking components was not created properly"
  }
}

# Test AKS with networking components integration
run "test_aks_with_network_integration" {
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
      aks_rg = {
        name = "test-aks-rg"
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
              name           = "aks-subnet"
              address_prefix = "10.0.1.0/24"
            }
          }
        }
      }
      
      public_ip_addresses = {
        pip1 = {
          resource_group_key = "network_rg"
          name               = "test-aks-pip"
          allocation_method  = "Static"
          sku                = "Standard"
          ip_version         = "IPv4"
        }
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
            vnet_key              = "vnet1"
            subnet_key            = "subnet1"
          }
          
          identity = {
            type = "SystemAssigned"
          }
          
          network_profile = {
            network_plugin    = "azure"
            load_balancer_sku = "standard"
            outbound_type     = "loadBalancer"
            load_balancer_profile = {
              outbound_ip_address_ids = ["${module.example.networking.public_ip_addresses.pip1.id}"]
            }
          }
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.compute.aks_clusters) > 0 && length(module.example.networking.vnets) > 0
    error_message = "AKS with networking components was not created properly"
  }
}

# Test load balancer with VM scale set integration
run "test_lb_vmss_integration" {
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
      compute_rg = {
        name = "test-compute-rg"
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
              name           = "vmss-subnet"
              address_prefix = "10.0.1.0/24"
            }
          }
        }
      }
      
      public_ip_addresses = {
        pip1 = {
          resource_group_key = "network_rg"
          name               = "test-lb-pip"
          allocation_method  = "Static"
          sku                = "Standard"
          ip_version         = "IPv4"
        }
      }
      
      load_balancers = {
        lb1 = {
          resource_group_key = "network_rg"
          name               = "test-lb"
          sku                = "Standard"
          
          frontend_ip_configurations = {
            config1 = {
              name                  = "frontend-ip"
              public_ip_address_key = "pip1"
            }
          }
          
          backend_address_pools = {
            pool1 = {
              name = "vmss-backend"
            }
          }
          
          probes = {
            probe1 = {
              name                = "http-probe"
              protocol            = "Http"
              port                = 80
              request_path        = "/"
              interval_in_seconds = 5
              number_of_probes    = 2
            }
          }
          
          load_balancing_rules = {
            rule1 = {
              name                           = "http-rule"
              frontend_ip_configuration_name = "frontend-ip"
              backend_address_pool_name      = "vmss-backend"
              probe_name                     = "http-probe"
              protocol                       = "Tcp"
              frontend_port                  = 80
              backend_port                   = 80
            }
          }
        }
      }
    }
    
    compute = {
      virtual_machine_scale_sets = {
        vmss1 = {
          resource_group_key = "compute_rg"
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
              
              ip_configurations = {
                config1 = {
                  name                                         = "primary"
                  subnet_key                                   = "subnet1"
                  vnet_key                                     = "vnet1"
                  private_ip_address_allocation                = "Dynamic"
                  load_balancer_backend_address_pool_ids       = ["${module.example.networking.load_balancers.lb1.backend_address_pools.pool1.id}"]
                }
              }
            }
          }
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.compute.virtual_machine_scale_sets) > 0 && length(module.example.networking.load_balancers) > 0
    error_message = "Load balancer with VM scale set integration was not created properly"
  }
}

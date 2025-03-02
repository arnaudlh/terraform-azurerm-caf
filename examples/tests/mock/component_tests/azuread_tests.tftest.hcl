mock_provider "azurerm" {
  source = "../../../mock_data"
}

mock_provider "azuread" {
  source = "../../../mock_data"
}

# Test Azure AD application creation
run "test_azuread_application_creation" {
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
    
    azuread_applications = {
      app1 = {
        display_name = "test-application"
        available_to_other_tenants = false
        
        reply_urls = [
          "https://test-app.example.com/auth/callback"
        ]
        
        required_resource_access = {
          microsoft_graph = {
            resource_app_id = "00000003-0000-0000-c000-000000000000"
            
            resource_access = {
              user_read = {
                id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d"
                type = "Scope"
              }
            }
          }
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.azuread_applications) > 0
    error_message = "Azure AD application was not created"
  }
}

# Test Azure AD service principal creation
run "test_azuread_service_principal_creation" {
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
    
    azuread_applications = {
      app1 = {
        display_name = "test-application"
      }
    }
    
    azuread_service_principals = {
      sp1 = {
        application_key = "app1"
      }
    }
  }
  
  assert {
    condition     = length(module.example.azuread_service_principals) > 0
    error_message = "Azure AD service principal was not created"
  }
}

# Test Azure AD group creation
run "test_azuread_group_creation" {
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
    
    azuread_groups = {
      group1 = {
        name        = "test-group"
        description = "Test Azure AD Group"
        
        members = {
          # Can be populated with user object IDs if needed
        }
        
        owners = {
          # Can be populated with user object IDs if needed
        }
        
        prevent_duplicate_name = true
      }
    }
  }
  
  assert {
    condition     = length(module.example.azuread_groups) > 0
    error_message = "Azure AD group was not created"
  }
}

# Test Azure AD user creation
run "test_azuread_user_creation" {
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
    
    azuread_users = {
      user1 = {
        user_principal_name = "testuser@example.com"
        display_name        = "Test User"
        password            = "ComplexP@ssw0rd!"
        account_enabled     = true
      }
    }
  }
  
  assert {
    condition     = length(module.example.azuread_users) > 0
    error_message = "Azure AD user was not created"
  }
}

# Test Azure AD role assignment
run "test_azuread_role_assignment" {
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
    
    azuread_users = {
      user1 = {
        user_principal_name = "testuser@example.com"
        display_name        = "Test User"
        password            = "ComplexP@ssw0rd!"
        account_enabled     = true
      }
    }
    
    azuread_roles = {
      role1 = {
        role_definition_name = "Global Administrator"
        
        principals = {
          users = {
            keys = ["user1"]
          }
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.azuread_roles) > 0
    error_message = "Azure AD role assignment was not created"
  }
}

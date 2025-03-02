mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

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
    
    azuread = {
      azuread_applications = {
        app1 = {
          display_name               = "test-application"
          available_to_other_tenants = false
          reply_urls                 = ["https://test-app.example.com/auth/callback"]
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
  }

  assert {
    condition     = length(module.example.azuread.azuread_applications) > 0
    error_message = "Azure AD application was not created"
  }
  
  assert {
    condition     = module.example.azuread.azuread_applications.app1.display_name == "test-application"
    error_message = "Azure AD application display name does not match expected value"
  }
}

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
    
    azuread = {
      azuread_applications = {
        app1 = {
          display_name               = "test-application"
          available_to_other_tenants = false
        }
      }
      
      azuread_service_principals = {
        sp1 = {
          application_key = "app1"
        }
      }
    }
  }

  assert {
    condition     = length(module.example.azuread.azuread_service_principals) > 0
    error_message = "Azure AD service principal was not created"
  }
  
  assert {
    condition     = module.example.azuread.azuread_service_principals.sp1.application_key == "app1"
    error_message = "Azure AD service principal application key does not match expected value"
  }
}

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
    
    azuread = {
      azuread_groups = {
        group1 = {
          name        = "test-group"
          description = "Test security group"
          security_enabled = true
        }
      }
    }
  }

  assert {
    condition     = length(module.example.azuread.azuread_groups) > 0
    error_message = "Azure AD group was not created"
  }
  
  assert {
    condition     = module.example.azuread.azuread_groups.group1.name == "test-group"
    error_message = "Azure AD group name does not match expected value"
  }
}

mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

run "test_storage_account_creation" {
  command = plan

  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      storage_region1 = {
        name = "test-storage-rg"
      }
    }
    
    storage = {
      storage_accounts = {
        sa1 = {
          resource_group_key       = "storage_region1"
          name                     = "teststorageaccount"
          account_kind             = "StorageV2"
          account_tier             = "Standard"
          account_replication_type = "LRS"
        }
      }
    }
  }

  assert {
    condition     = length(module.example.storage.storage_accounts) > 0
    error_message = "Storage account was not created"
  }
  
  assert {
    condition     = module.example.storage.storage_accounts.sa1.name == "teststorageaccount"
    error_message = "Storage account name does not match expected value"
  }
}

run "test_sql_server_database_creation" {
  command = plan

  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      database_region1 = {
        name = "test-database-rg"
      }
    }
    
    storage = {
      mssql_servers = {
        sql1 = {
          resource_group_key = "database_region1"
          name               = "test-sql-server"
          version            = "12.0"
          administrator_login = "sqladmin"
          administrator_login_password = "ComplexP@ssw0rd!"
          connection_policy = "Default"
          minimum_tls_version = "1.2"
        }
      }
    }
  }

  assert {
    condition     = length(module.example.storage.mssql_servers) > 0
    error_message = "SQL server was not created"
  }
  
  assert {
    condition     = module.example.storage.mssql_servers.sql1.name == "test-sql-server"
    error_message = "SQL server name does not match expected value"
  }
}

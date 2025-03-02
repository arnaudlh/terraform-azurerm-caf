mock_provider "azurerm" {
  source = "../../mock_data"
}

mock_provider "azuread" {
  source = "../../mock_data"
}

# Test storage account creation
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
    
    storage_accounts = {
      sa1 = {
        resource_group_key = "storage_region1"
        name               = "teststorageaccount"
        account_kind       = "StorageV2"
        account_tier       = "Standard"
        account_replication_type = "LRS"
      }
    }
  }
  
  assert {
    condition     = length(module.example.storage_accounts) > 0
    error_message = "Storage account was not created"
  }
}

# Test SQL server and database creation
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
      sql_region1 = {
        name = "test-sql-rg"
      }
    }
    
    mssql_servers = {
      sql1 = {
        resource_group_key = "sql_region1"
        name               = "test-sql-server"
        version            = "12.0"
        administrator_login = "sqladmin"
        administrator_login_password = "ComplexP@ssw0rd!"
        connection_policy = "Default"
        minimum_tls_version = "1.2"
      }
    }
    
    mssql_databases = {
      db1 = {
        resource_group_key = "sql_region1"
        server_key         = "sql1"
        name               = "test-sql-db"
        sku_name           = "Basic"
        collation          = "SQL_Latin1_General_CP1_CI_AS"
        max_size_gb        = 2
      }
    }
  }
  
  assert {
    condition     = length(module.example.mssql_servers) > 0 && length(module.example.mssql_databases) > 0
    error_message = "SQL server and database were not created"
  }
}

# Test Cosmos DB account and database creation
run "test_cosmos_db_creation" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      cosmos_region1 = {
        name = "test-cosmos-rg"
      }
    }
    
    cosmos_dbs = {
      cosmos1 = {
        resource_group_key = "cosmos_region1"
        name               = "test-cosmos-account"
        offer_type         = "Standard"
        kind               = "GlobalDocumentDB"
        
        consistency_policy = {
          consistency_level = "Session"
        }
        
        geo_locations = {
          region1 = {
            failover_priority = 0
          }
        }
        
        capabilities = {
          cap1 = {
            name = "EnableServerless"
          }
        }
      }
    }
    
    cosmos_sql_databases = {
      db1 = {
        name               = "test-cosmos-sql-db"
        resource_group_key = "cosmos_region1"
        cosmos_account_key = "cosmos1"
      }
    }
  }
  
  assert {
    condition     = length(module.example.cosmos_dbs) > 0 && length(module.example.cosmos_sql_databases) > 0
    error_message = "Cosmos DB account and database were not created"
  }
}

# Test MySQL flexible server creation
run "test_mysql_flexible_server_creation" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      mysql_region1 = {
        name = "test-mysql-rg"
      }
    }
    
    mysql_flexible_servers = {
      mysql1 = {
        resource_group_key = "mysql_region1"
        name               = "test-mysql-server"
        administrator_login = "mysqladmin"
        administrator_password = "ComplexP@ssw0rd!"
        version            = "8.0.21"
        sku_name           = "B_Standard_B1s"
        zone               = "1"
        storage = {
          size_gb = 20
          iops    = 360
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.mysql_flexible_servers) > 0
    error_message = "MySQL flexible server was not created"
  }
}

# Test PostgreSQL flexible server creation
run "test_postgresql_flexible_server_creation" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      postgres_region1 = {
        name = "test-postgres-rg"
      }
    }
    
    postgresql_flexible_servers = {
      postgres1 = {
        resource_group_key = "postgres_region1"
        name               = "test-postgres-server"
        administrator_login = "postgresadmin"
        administrator_password = "ComplexP@ssw0rd!"
        version            = "13"
        sku_name           = "B_Standard_B1ms"
        zone               = "1"
        storage = {
          size_gb = 32
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.postgresql_flexible_servers) > 0
    error_message = "PostgreSQL flexible server was not created"
  }
}

# Test Synapse workspace creation
run "test_synapse_workspace_creation" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    resource_groups = {
      synapse_region1 = {
        name = "test-synapse-rg"
      }
    }
    
    storage_accounts = {
      sa1 = {
        resource_group_key = "synapse_region1"
        name               = "testsynapsestorage"
        account_kind       = "StorageV2"
        account_tier       = "Standard"
        account_replication_type = "LRS"
        is_hns_enabled     = true
      }
    }
    
    storage_containers = {
      sc1 = {
        name                 = "synapse"
        storage_account_key  = "sa1"
        container_access_type = "private"
      }
    }
    
    synapse_workspaces = {
      synapse1 = {
        resource_group_key = "synapse_region1"
        name               = "test-synapse"
        sql_administrator_login = "sqladmin"
        sql_administrator_login_password = "ComplexP@ssw0rd!"
        storage_data_lake_gen2_filesystem_id = {
          storage_account_key = "sa1"
          container_key       = "sc1"
        }
      }
    }
  }
  
  assert {
    condition     = length(module.example.synapse_workspaces) > 0
    error_message = "Synapse workspace was not created"
  }
}

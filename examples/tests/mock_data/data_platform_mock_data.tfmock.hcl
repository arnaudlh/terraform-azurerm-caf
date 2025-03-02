mock_data "azurerm_storage_account" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Storage/storageAccounts/mockstorageaccount"
    name                = "mockstorageaccount"
    location            = "eastus"
    resource_group_name = "mock-rg"
    account_tier        = "Standard"
    account_replication_type = "LRS"
    primary_blob_endpoint = "https://mockstorageaccount.blob.core.windows.net/"
    primary_access_key  = "mock-access-key"
  }
}

mock_data "azurerm_storage_container" {
  defaults = {
    id                  = "https://mockstorageaccount.blob.core.windows.net/mock-container"
    name                = "mock-container"
    storage_account_name = "mockstorageaccount"
    container_access_type = "private"
  }
}

mock_data "azurerm_storage_blob" {
  defaults = {
    id                  = "https://mockstorageaccount.blob.core.windows.net/mock-container/mock-blob"
    name                = "mock-blob"
    storage_account_name = "mockstorageaccount"
    storage_container_name = "mock-container"
    type                = "Block"
    size                = 1024
    content_type        = "application/octet-stream"
    url                 = "https://mockstorageaccount.blob.core.windows.net/mock-container/mock-blob"
  }
}

mock_data "azurerm_cosmosdb_account" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DocumentDB/databaseAccounts/mock-cosmos"
    name                = "mock-cosmos"
    location            = "eastus"
    resource_group_name = "mock-rg"
    offer_type          = "Standard"
    kind                = "GlobalDocumentDB"
    consistency_policy  = [{
      consistency_level = "Session"
    }]
    geo_location        = [{
      location          = "eastus"
      failover_priority = 0
    }]
    endpoint            = "https://mock-cosmos.documents.azure.com:443/"
    primary_key         = "mock-primary-key"
    connection_strings  = ["AccountEndpoint=https://mock-cosmos.documents.azure.com:443/;AccountKey=mock-primary-key;"]
  }
}

mock_data "azurerm_cosmosdb_sql_database" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DocumentDB/databaseAccounts/mock-cosmos/sqlDatabases/mock-sql-db"
    name                = "mock-sql-db"
    resource_group_name = "mock-rg"
    account_name        = "mock-cosmos"
    throughput          = 400
  }
}

mock_data "azurerm_mssql_server" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Sql/servers/mock-sql-server"
    name                = "mock-sql-server"
    location            = "eastus"
    resource_group_name = "mock-rg"
    version             = "12.0"
    administrator_login = "sqladmin"
    fully_qualified_domain_name = "mock-sql-server.database.windows.net"
  }
}

mock_data "azurerm_mssql_database" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Sql/servers/mock-sql-server/databases/mock-sql-db"
    name                = "mock-sql-db"
    server_id           = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Sql/servers/mock-sql-server"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    max_size_gb         = 2
    sku_name            = "Basic"
  }
}

mock_data "azurerm_mysql_server" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DBforMySQL/servers/mock-mysql-server"
    name                = "mock-mysql-server"
    location            = "eastus"
    resource_group_name = "mock-rg"
    version             = "5.7"
    administrator_login = "mysqladmin"
    fully_qualified_domain_name = "mock-mysql-server.mysql.database.azure.com"
  }
}

mock_data "azurerm_mysql_database" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DBforMySQL/servers/mock-mysql-server/databases/mock-mysql-db"
    name                = "mock-mysql-db"
    resource_group_name = "mock-rg"
    server_name         = "mock-mysql-server"
    charset             = "utf8"
    collation           = "utf8_general_ci"
  }
}

mock_data "azurerm_postgresql_server" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DBforPostgreSQL/servers/mock-postgres-server"
    name                = "mock-postgres-server"
    location            = "eastus"
    resource_group_name = "mock-rg"
    version             = "11"
    administrator_login = "postgresadmin"
    fully_qualified_domain_name = "mock-postgres-server.postgres.database.azure.com"
  }
}

mock_data "azurerm_postgresql_database" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DBforPostgreSQL/servers/mock-postgres-server/databases/mock-postgres-db"
    name                = "mock-postgres-db"
    resource_group_name = "mock-rg"
    server_name         = "mock-postgres-server"
    charset             = "UTF8"
    collation           = "English_United States.1252"
  }
}

mock_data "azurerm_synapse_workspace" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Synapse/workspaces/mock-synapse"
    name                = "mock-synapse"
    location            = "eastus"
    resource_group_name = "mock-rg"
    storage_data_lake_gen2_filesystem_id = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Storage/storageAccounts/mockstorageaccount/blobServices/default/containers/mock-container"
    sql_administrator_login = "sqladmin"
    connectivity_endpoints = {
      dev = "https://mock-synapse.dev.azuresynapse.net"
      sql = "mock-synapse.sql.azuresynapse.net"
      sqlOnDemand = "mock-synapse-ondemand.sql.azuresynapse.net"
      web = "https://web.azuresynapse.net?workspace=%2fsubscriptions%2f00000000-0000-0000-0000-000000000001%2fresourceGroups%2fmock-rg%2fproviders%2fMicrosoft.Synapse%2fworkspaces%2fmock-synapse"
    }
  }
}

mock_data "azurerm_data_factory" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DataFactory/factories/mock-adf"
    name                = "mock-adf"
    location            = "eastus"
    resource_group_name = "mock-rg"
  }
}

mock_data "azurerm_data_factory_pipeline" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DataFactory/factories/mock-adf/pipelines/mock-pipeline"
    name                = "mock-pipeline"
    data_factory_id     = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DataFactory/factories/mock-adf"
  }
}

mock_data "azurerm_data_factory_dataset_sql_server_table" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DataFactory/factories/mock-adf/datasets/mock-dataset"
    name                = "mock-dataset"
    data_factory_id     = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.DataFactory/factories/mock-adf"
    linked_service_name = "mock-linked-service"
    table_name          = "mock-table"
  }
}

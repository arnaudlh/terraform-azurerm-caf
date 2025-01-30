resource "azurerm_mysql_server" "mysql" {
  name                = azurecaf_name.mysql.result
  resource_group_name = local.resource_group_name
  location            = local.location
  version            = var.settings.version
  sku_name           = var.settings.sku_name

  administrator_login          = var.settings.administrator_login
  administrator_login_password = try(var.settings.administrator_login_password, azurerm_key_vault_secret.mysql_admin_password.0.value)
  ssl_enforcement_enabled     = try(var.settings.ssl_enforcement_enabled, true)
  storage_mb                  = try(var.settings.storage_mb, 5120)
  tags                       = local.tags

  dynamic "storage" {
    for_each = try(var.settings.storage_mb, null) != null ? [1] : []
    content {
      size_gb = var.settings.storage_mb / 1024
      iops    = try(var.settings.storage.iops, null)
    }
  }

  dynamic "high_availability" {
    for_each = try(var.settings.high_availability, null) != null ? [1] : []
    content {
      mode                      = var.settings.high_availability.mode
      standby_availability_zone = try(var.settings.high_availability.standby_availability_zone, null)
    }
  }

  dynamic "maintenance_window" {
    for_each = try(var.settings.maintenance_window, null) != null ? [1] : []
    content {
      day_of_week  = try(var.settings.maintenance_window.day_of_week, 0)
      start_hour   = try(var.settings.maintenance_window.start_hour, 0)
      start_minute = try(var.settings.maintenance_window.start_minute, 0)
    }
  }

}

resource "azurecaf_name" "mysql" {
  name          = var.settings.name
  resource_type = "azurerm_mysql_flexible_server"
  prefixes      = var.global_settings.prefixes
  random_length = var.global_settings.random_length
  clean_input   = true
  passthrough   = var.global_settings.passthrough
}

# Generate sql server random admin password if not provided in the attribute administrator_login_password
resource "random_password" "mysql_admin" {
  count = try(var.settings.administrator_login_password, null) == null ? 1 : 0

  length           = 32
  special          = true
  override_special = "_%@"

}

# Store the generated password into keyvault
resource "azurerm_key_vault_secret" "mysql_admin_password" {
  count = try(var.settings.administrator_login_password, null) == null ? 1 : 0

  name         = format("%s-password", azurecaf_name.mysql.result)
  value        = random_password.mysql_admin.0.result
  key_vault_id = var.keyvault_id

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}

resource "azurerm_key_vault_secret" "sql_admin" {
  count = try(var.settings.administrator_login_password, null) == null ? 1 : 0

  name         = format("%s-username", azurecaf_name.mysql.result)
  value        = var.settings.administrator_login
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "mysql_admin_login_name" {
  count = try(var.settings.administrator_login_password, null) == null ? 1 : 0

  name         = format("%s-login-name", azurecaf_name.mysql.result)
  value        = format("%s@%s", var.settings.administrator_login, azurerm_mysql_flexible_server.mysql.fqdn)
  key_vault_id = var.keyvault_id
}

resource "azurerm_key_vault_secret" "mysql_fqdn" {
  count = try(var.settings.administrator_login_password, null) == null ? 1 : 0

  name         = format("%s-fqdn", azurecaf_name.mysql.result)
  value        = azurerm_mysql_flexible_server.mysql.fqdn
  key_vault_id = var.keyvault_id
}

resource "azurerm_mysql_flexible_server_active_directory_administrator" "mysql_administrator" {
  count = try(var.settings.azuread_administrator, null) == null ? 0 : 1

  server_id    = azurerm_mysql_flexible_server.mysql.id
  identity_id  = try(var.settings.azuread_administrator.identity_id, null)
  login        = try(var.settings.azuread_administrator.login_username, var.azuread_groups[var.settings.azuread_administrator.azuread_group_key].name)
  object_id    = try(var.settings.azuread_administrator.object_id, var.azuread_groups[var.settings.azuread_administrator.azuread_group_key].id)
  tenant_id    = try(var.settings.azuread_administrator.tenant_id, var.azuread_groups[var.settings.azuread_administrator.azuread_group_key].tenant_id)
}

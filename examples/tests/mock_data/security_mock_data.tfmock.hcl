mock_data "azurerm_key_vault" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.KeyVault/vaults/mock-kv"
    name                = "mock-kv"
    location            = "eastus"
    resource_group_name = "mock-rg"
    tenant_id           = "00000000-0000-0000-0000-000000000000"
    sku_name            = "standard"
    vault_uri           = "https://mock-kv.vault.azure.net/"
  }
}

mock_data "azurerm_key_vault_key" {
  defaults = {
    id                  = "https://mock-kv.vault.azure.net/keys/mock-key/00000000000000000000000000000000"
    name                = "mock-key"
    key_vault_id        = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.KeyVault/vaults/mock-kv"
    key_type            = "RSA"
    key_size            = 2048
    version             = "00000000000000000000000000000000"
    versionless_id      = "https://mock-kv.vault.azure.net/keys/mock-key"
  }
}

mock_data "azurerm_key_vault_secret" {
  defaults = {
    id                  = "https://mock-kv.vault.azure.net/secrets/mock-secret/00000000000000000000000000000000"
    name                = "mock-secret"
    key_vault_id        = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.KeyVault/vaults/mock-kv"
    value               = "mock-secret-value"
    version             = "00000000000000000000000000000000"
    versionless_id      = "https://mock-kv.vault.azure.net/secrets/mock-secret"
  }
}

mock_data "azurerm_key_vault_certificate" {
  defaults = {
    id                  = "https://mock-kv.vault.azure.net/certificates/mock-cert/00000000000000000000000000000000"
    name                = "mock-cert"
    key_vault_id        = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.KeyVault/vaults/mock-kv"
    certificate_data    = "mock-certificate-data"
    thumbprint          = "0000000000000000000000000000000000000000"
    version             = "00000000000000000000000000000000"
    versionless_id      = "https://mock-kv.vault.azure.net/certificates/mock-cert"
  }
}

mock_data "azurerm_disk_encryption_set" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Compute/diskEncryptionSets/mock-des"
    name                = "mock-des"
    location            = "eastus"
    resource_group_name = "mock-rg"
    key_vault_key_id    = "https://mock-kv.vault.azure.net/keys/mock-key/00000000000000000000000000000000"
    identity            = [{
      type              = "SystemAssigned"
      principal_id      = "00000000-0000-0000-0000-000000000011"
      tenant_id         = "00000000-0000-0000-0000-000000000000"
    }]
  }
}

mock_data "azurerm_user_assigned_identity" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.ManagedIdentity/userAssignedIdentities/mock-identity"
    name                = "mock-identity"
    location            = "eastus"
    resource_group_name = "mock-rg"
    principal_id        = "00000000-0000-0000-0000-000000000012"
    client_id           = "00000000-0000-0000-0000-000000000013"
    tenant_id           = "00000000-0000-0000-0000-000000000000"
  }
}

mock_data "azurerm_role_assignment" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Authorization/roleAssignments/00000000-0000-0000-0000-000000000014"
    name                = "00000000-0000-0000-0000-000000000014"
    principal_id        = "00000000-0000-0000-0000-000000000012"
    role_definition_id  = "/subscriptions/00000000-0000-0000-0000-000000000001/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
    scope               = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg"
  }
}

mock_data "azurerm_role_definition" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
    name                = "b24988ac-6180-42a0-ab88-20f7382dd24c"
    role_definition_id  = "b24988ac-6180-42a0-ab88-20f7382dd24c"
    scope               = "/subscriptions/00000000-0000-0000-0000-000000000001"
    description         = "Contributor"
    type                = "BuiltInRole"
    assignable_scopes   = ["/subscriptions/00000000-0000-0000-0000-000000000001"]
  }
}

mock_data "azurerm_security_center_subscription_pricing" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/providers/Microsoft.Security/pricings/VirtualMachines"
    name                = "VirtualMachines"
    tier                = "Standard"
  }
}

mock_data "azurerm_security_center_contact" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/providers/Microsoft.Security/securityContacts/default"
    name                = "default"
    email               = "security@example.com"
    phone               = "+1-555-555-5555"
    alert_notifications = true
    alerts_to_admins    = true
  }
}

mock_data "azurerm_security_center_setting" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/providers/Microsoft.Security/settings/MCAS"
    name                = "MCAS"
    enabled             = true
  }
}

mock_data "azurerm_security_center_workspace" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/providers/Microsoft.Security/workspaceSettings/default"
    scope               = "/subscriptions/00000000-0000-0000-0000-000000000001"
    workspace_id        = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.OperationalInsights/workspaces/mock-workspace"
  }
}

mock_data "azurerm_sentinel_alert_rule_ms_security_incident" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.OperationalInsights/workspaces/mock-workspace/providers/Microsoft.SecurityInsights/alertRules/mock-alert-rule"
    name                = "mock-alert-rule"
    log_analytics_workspace_id = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.OperationalInsights/workspaces/mock-workspace"
    display_name        = "Mock Alert Rule"
    product_filter      = "Microsoft Cloud App Security"
    severity_filter     = ["High"]
    alert_rule_template_guid = "00000000-0000-0000-0000-000000000015"
  }
}

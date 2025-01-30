
data "azurerm_subscription" "primary" {}
data "azurerm_client_config" "current" {}
data "azuread_client_config" "current" {}

data "azuread_service_principal" "logged_in_app" {
  count          = var.logged_aad_app_objectId == null ? 0 : 1
  application_id = data.azuread_client_config.current.client_id
}

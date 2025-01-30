terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.16.0"
      configuration_aliases = [
        azurerm.vhub
      ]
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.43.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "1.6.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "1.2.0"
    }
    null = {
      source = "hashicorp/null"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.12.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.3.4"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6"
    }
  }
  required_version = ">= 1.3.5"
}

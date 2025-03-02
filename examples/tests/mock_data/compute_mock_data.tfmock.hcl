mock_data "azurerm_virtual_machine" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Compute/virtualMachines/mock-vm"
    name                = "mock-vm"
    location            = "eastus"
    resource_group_name = "mock-rg"
    vm_size             = "Standard_DS1_v2"
  }
}

mock_data "azurerm_kubernetes_cluster" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.ContainerService/managedClusters/mock-aks"
    name                = "mock-aks"
    location            = "eastus"
    resource_group_name = "mock-rg"
    kubernetes_version  = "1.24.0"
    dns_prefix          = "mock-aks"
  }
}

mock_data "azurerm_virtual_machine_scale_set" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Compute/virtualMachineScaleSets/mock-vmss"
    name                = "mock-vmss"
    location            = "eastus"
    resource_group_name = "mock-rg"
    sku_name            = "Standard_DS1_v2"
    instances           = 2
  }
}

mock_data "azurerm_container_registry" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.ContainerRegistry/registries/mockacr"
    name                = "mockacr"
    location            = "eastus"
    resource_group_name = "mock-rg"
    admin_enabled       = false
    sku                 = "Standard"
    login_server        = "mockacr.azurecr.io"
  }
}

mock_data "azurerm_container_group" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.ContainerInstance/containerGroups/mock-aci"
    name                = "mock-aci"
    location            = "eastus"
    resource_group_name = "mock-rg"
    ip_address          = "10.0.0.1"
    dns_name_label      = "mock-aci"
  }
}

mock_data "azurerm_proximity_placement_group" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Compute/proximityPlacementGroups/mock-ppg"
    name                = "mock-ppg"
    location            = "eastus"
    resource_group_name = "mock-rg"
  }
}

mock_data "azurerm_dedicated_host" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Compute/hostGroups/mock-host-group/hosts/mock-host"
    name                = "mock-host"
    location            = "eastus"
    resource_group_name = "mock-rg"
    sku_name            = "DSv3-Type1"
    platform_fault_domain = 1
  }
}

mock_data "azurerm_availability_set" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Compute/availabilitySets/mock-avset"
    name                = "mock-avset"
    location            = "eastus"
    resource_group_name = "mock-rg"
    platform_fault_domain_count = 2
    platform_update_domain_count = 5
  }
}

mock_data "azurerm_windows_virtual_machine" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Compute/virtualMachines/mock-win-vm"
    name                = "mock-win-vm"
    location            = "eastus"
    resource_group_name = "mock-rg"
    size                = "Standard_DS1_v2"
    admin_username      = "adminuser"
    admin_password      = "P@ssw0rd1234!"
  }
}

mock_data "azurerm_linux_virtual_machine" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Compute/virtualMachines/mock-linux-vm"
    name                = "mock-linux-vm"
    location            = "eastus"
    resource_group_name = "mock-rg"
    size                = "Standard_DS1_v2"
    admin_username      = "adminuser"
  }
}

mock_data "azurerm_virtual_machine" {
  defaults = {
    id                  = "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Compute/virtualMachines/mock-vm"
    name                = "mock-vm"
    location            = "eastus"
    resource_group_name = "mock-rg"
    size                = "Standard_D2s_v3"
    network_interface_ids = [
      "/subscriptions/00000000-0000-0000-0000-000000000001/resourceGroups/mock-rg/providers/Microsoft.Network/networkInterfaces/mock-nic"
    ]
  }
}

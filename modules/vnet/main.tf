resource "azurerm_virtual_network" "vm_network" {
  name                = "vnet-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "vm_sub" {
  resource_group_name  = var.resource_group_name
  name                 = "subnet-${var.name}"
  address_prefixes     = var.subnet_address
  virtual_network_name = azurerm_virtual_network.vm_network.name
}

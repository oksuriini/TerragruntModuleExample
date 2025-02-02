resource "azurerm_public_ip" "vm" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = "pip-${var.name}"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "vm" {
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = "nic-${var.name}"
  ip_configuration {
    name                          = "nic-pip"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm.id
    subnet_id                     = var.subnet_id
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "vm-${var.name}"
  location              = var.location
  network_interface_ids = [azurerm_network_interface.vm.id]
  resource_group_name   = var.resource_group_name

  size = "Standard_B2s"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 30
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  disable_password_authentication = var.admin_password == "" ? true : false

  admin_username = var.admin_username
  admin_password = var.admin_password
}

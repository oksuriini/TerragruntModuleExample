output "vnet_pip_address" {
  value = azurerm_public_ip.vm.ip_address
}

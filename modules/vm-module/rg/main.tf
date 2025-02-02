resource "azurerm_resource_group" "resources" {
  name     = "rg-${var.name}"
  location = var.location
}

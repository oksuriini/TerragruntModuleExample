terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.0.0"
    }
  }
}

module "rg" {
  source   = "./rg/"
  name     = var.name
  location = var.location
}

module "vnet" {
  source = "./vnet/"

  resource_group_name = module.rg.resource_group_name
  location            = module.rg.resource_group_location

  name           = var.name
  address_space  = var.address_space
  subnet_address = var.subnet_address

}

module "vm" {
  source = "./vm/"

  resource_group_name = module.rg.resource_group_name
  location            = module.rg.resource_group_location

  name = var.name

  admin_password = var.admin_password
  admin_username = var.admin_username
  subnet_id      = module.vnet.subnet_id
}

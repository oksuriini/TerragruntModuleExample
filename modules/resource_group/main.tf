terraform {
  required_version = ">= 1.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3"
    }
  }
}

provider "azurerm" {
  features {
  }
}

# Yo does this work
module "rg" {
  source = "../resource_group/"

  name     = var.name
  location = var.location
}

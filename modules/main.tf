module "vm_module" {
  source = "./vm-module/"

  name     = var.name
  location = var.location

  address_space  = var.address_space
  subnet_address = var.subnet_address

  admin_password = var.admin_password
  admin_username = var.admin_username
}

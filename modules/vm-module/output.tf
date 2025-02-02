output "rg_name" {
  value = module.rg.resource_group_name
}

output "rg_location" {
  value = module.rg.resource_group_location
}

output "subnet_id" {
  value = module.vnet.subnet_id
}

output "pip" {
  value = module.vm.vnet_pip_address
}


variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "address_space" {
  type = set(string)
}

variable "resource_group_name" {
  type = string
}

variable "subnet_address" {
  type = list(string)
}

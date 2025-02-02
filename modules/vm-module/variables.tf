variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_address" {
  type = list(string)
}

variable "address_space" {
  type = set(string)
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "admin_username" {
  type      = string
  sensitive = true
}

variable "name_prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
  }
}

variable "address_space" {
  type = string
}

variable "postgres_subnet_address_prefix" {
  type = string
}

variable "aks_subnet_address_prefix" {
  type = string
}

variable "resourcegroup_name" {
  type = string
}
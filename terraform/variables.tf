#location variable

variable "location" {
  type    = string
  default = "canadacentral"
}

#virtual network variables

variable "address_space" {
  type    = string
  default = "10.0.0.0/16"
}

variable "postgres_subnet_address_prefix" {
  type    = string
  default = "10.0.1.0/24"
}

variable "aks_subnet_address_prefix" {
  type    = string
  default = "10.0.2.0/24"
}

#aks variables

variable "aks_node_count" {
  type    = number
  default = 2
}

variable "minimum_node_count" {
  type    = number
  default = 2
}

variable "maximum_node_count" {
  type    = number
  default = 5
}

variable "aks_node_vm_size" {
  type    = string
  default = "Standard_D2alds_v6"
}


#postgresql variables

variable "postgres_version" {
  type    = number
  default = 18
}

variable "postgres_admin_username" {
  type    = string
  default = "credpayadmin"
}

variable "postgres_db_name" {
  type    = string
  default = "credpay"
}

variable "log_retention_days" {
  type    = number
  default = 35
}


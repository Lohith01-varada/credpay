variable "location" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {
  }
}

variable "resourcegroup_name" {
  type = string
}

variable "log_retention_days" {
  type = number
}
variable "name_prefix" {
  description = "Prefix for the resource names"
  type        = string
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
}

variable "resourcegroup_name" {
  description = "Name of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
}

variable "postgres_admin_username" {
  description = "Admin username for the PostgreSQL server"
  type        = string
}

variable "postgres_version" {
  description = "Version of PostgreSQL to use"
  type        = number
}

variable "postgres_db_name" {
  description = "Name of the PostgreSQL database"
  type        = string
}
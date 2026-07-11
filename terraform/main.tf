locals {
  name_prefix = "credpay"
  tags = {
    environment = "dev"
    project     = "credcard"
  }
}

module "resource_group" {
  source      = "./modules/resourcegroup"
  name_prefix = local.name_prefix
  location    = var.location
  tags        = local.tags
}

module "vnet" {
  source                         = "./modules/virtualnetwork"
  name_prefix                    = local.name_prefix
  location                       = module.resource_group.location
  resourcegroup_name             = module.resource_group.resourcegroup_name
  tags                           = local.tags
  address_space                  = var.address_space
  postgres_subnet_address_prefix = var.postgres_subnet_address_prefix
  aks_subnet_address_prefix      = var.aks_subnet_address_prefix
}

module "monitoring" {
  source             = "./modules/monitoring"
  name_prefix        = local.name_prefix
  location           = module.resource_group.location
  resourcegroup_name = module.resource_group.resourcegroup_name
  log_retention_days = var.log_retention_days
  tags               = local.tags
}

module "postgres" {
  source                  = "./modules/postgres"
  name_prefix             = local.name_prefix
  location                = module.resource_group.location
  resourcegroup_name      = module.resource_group.resourcegroup_name
  tags                    = local.tags
  postgres_version        = var.postgres_version
  postgres_admin_username = var.postgres_admin_username
  postgres_db_name        = var.postgres_db_name
}

module "aks" {
  source                       = "./modules/aks"
  name_prefix                  = local.name_prefix
  location                     = module.resource_group.location
  resourcegroup_name           = module.resource_group.resourcegroup_name
  tags                         = local.tags
  aks_node_count               = var.aks_node_count
  minimum_node_count           = var.minimum_node_count
  maximum_node_count           = var.maximum_node_count
  aks_node_vm_size             = var.aks_node_vm_size
  aks_subnet_id = module.vnet.aks_subnet_id
  log_analytics_workspace_id   = module.monitoring.log_analytics_workspace_id
  log_analytics_workspace_name = module.monitoring.log_analytics_workspace_name
}
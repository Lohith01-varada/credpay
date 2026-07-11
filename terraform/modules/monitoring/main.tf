resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "${var.name_prefix}-log-analytics"
  location            = var.location
  resource_group_name = var.resourcegroup_name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_retention_days
  tags                = var.tags
}

# resource "azurerm_log_analytics_solution" "ContainerInsights" {
#   solution_name         = "${var.name_prefix}-log-analytics-solution"
#   location              = var.location
#   resource_group_name   = var.resourcegroup_name
#   workspace_resource_id = azurerm_log_analytics_workspace.log_analytics.id
#   workspace_name        = azurerm_log_analytics_workspace.log_analytics.name
#   plan {
#     publisher = "Microsoft"
#     product   = "OMSGallery/ContainerInsights"
#   }
#   tags = var.tags
# }
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name_prefix}-vnet"
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = var.resourcegroup_name
  tags                = var.tags
  
}

resource "azurerm_subnet" "subnet_postgres" {
  name                 = "${var.name_prefix}-subnet-postgres"
  resource_group_name  = var.resourcegroup_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.postgres_subnet_address_prefix]
}

resource "azurerm_subnet" "subnet_aks" {
  name                 = "${var.name_prefix}-subnet-aks"
  resource_group_name  = var.resourcegroup_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.aks_subnet_address_prefix]
}
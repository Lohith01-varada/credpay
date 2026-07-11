resource "random_password" "admin_password" {
  length           = 24
  special          = true
  override_special = "!@#$%^&*()-_=+[]{}<>:?"
  min_lower         = 2
    min_upper         = 2
    min_numeric       = 2
    min_special       = 2
}


resource "azurerm_postgresql_flexible_server" "postgres" {
  name                = "${var.name_prefix}-postgres"
  location            = var.location
  resource_group_name = var.resourcegroup_name
  version             = var.postgres_version
  administrator_login = var.postgres_admin_username
  administrator_password = random_password.admin_password.result
  sku_name            = "B_Standard_B2s"
  storage_mb          = 32768
  backup_retention_days = 30
  geo_redundant_backup_enabled = false
  public_network_access_enabled = true
  tags = var.tags
  depends_on = [random_password.admin_password]
}

resource "azurerm_postgresql_flexible_server_database" "credpay_db" {
  name                = var.postgres_db_name
  server_id           = azurerm_postgresql_flexible_server.postgres.id
  charset             = "UTF8"
  collation           = "en_US.utf8"
}

resource "azurerm_postgresql_flexible_server_configuration" "ssl_enforcement" {
  name                = "require_secure_transport"
  server_id           = azurerm_postgresql_flexible_server.postgres.id
  value               = "ON"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_aks" {
  name                = "allow-aks"
  server_id           = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
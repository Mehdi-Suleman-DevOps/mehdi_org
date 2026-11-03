data "azurerm_key_vault" "main" {
  name                = "maddy"
  resource_group_name = "rg-abc-elearn-prod-cin-001"
  
}

data "azurerm_key_vault_secret" "admin_username" {
  name         = "dbusername"
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "dbpassword"
  key_vault_id = data.azurerm_key_vault.main.id
}


resource "azurerm_mssql_server" "sql_server" {
  for_each = var.ch_sql

  name                                = each.value.server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.admin_username.value
  administrator_login_password = data.azurerm_key_vault_secret.admin_password.value
  minimum_tls_version = each.value.minimum_tls_version
  public_network_access_enabled = each.value.public_network_access_enabled
}

resource "azurerm_mssql_database" "sql_database" {
  for_each = var.ch_sql
  name      = each.value.sql_database_name
  server_id = azurerm_mssql_server.sql_server[each.key].id
  sku_name    = each.value.sku_name
  max_size_gb = each.value.max_size_gb
  zone_redundant = each.value.zone_redundant
}

# resource "azurerm_mssql_firewall_rule" "sql_firewall" {
#   for_each = var.ch_sql

#   name             = "AllowTrustedClient"
#   server_id        = azurerm_mssql_server.sql_server[each.key].id
#   start_ip_address = each.value.client_start_ip
#   end_ip_address   = each.value.client_end_ip
# }
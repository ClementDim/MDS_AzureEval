# Generate a random password
resource "random_password" "sql_admin_password" {
  length  = 16
  min_lower = 1
  min_upper = 1
  min_numeric = 1
  min_special = 1
  override_special = "_%@"
}

# Add the password to the key vault
resource "azurerm_key_vault_secret" "sql_admin_password_vk" {
  name = "${var.AZURE_RESSOURCE_NAME}-mssql-admin-password"
  value = random_password.sql_admin_password.result
  key_vault_id = azurerm_key_vault.vault.id
}

# Create a SQL server
resource "azurerm_mssql_server" "mssql" {
  name = var.AZURE_RESSOURCE_NAME
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  version = "12.0"
  administrator_login = "administrateur"
  administrator_login_password = random_password.sql_admin_password.result
  minimum_tls_version = "1.2"

  azuread_administrator {
    login_username = "digital"
    object_id = data.azurerm_client_config.current.object_id
  }
}
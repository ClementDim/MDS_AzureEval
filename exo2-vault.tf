# Get current user
data "azurerm_client_config" "current" {}

# Create key vault
resource "azurerm_key_vault" "vault" {
  location = azurerm_resource_group.rg.location
  name =  "${azurerm_resource_group.rg.name}-vault"
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = []
    secret_permissions = ["Get", "List", "Delete", "Recover", "Purge", "Backup", "Restore", "Set"]
    storage_permissions = []
  }

  network_acls {
    default_action = "Deny"
    bypass = "AzureServices"
    ip_rules = ["86.238.200.51"]
  }
}

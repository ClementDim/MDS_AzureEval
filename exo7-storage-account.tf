# Get existing ressource group named "bonchance"
data "azurerm_resource_group" "rg-bonchance" {
  name = "bonchance"
}

# Create 2 storage account on rg bonchance
resource "azurerm_storage_account" "storage" {
  for_each = var.AZURE_STORAGE_CONFIG
  name = "${var.AZURE_RESSOURCE_NAME}${each.key}"
  resource_group_name = data.azurerm_resource_group.rg-bonchance.name
  location = data.azurerm_resource_group.rg-bonchance.location
  account_tier = each.value.account_tier
  account_replication_type = "LRS"
  access_tier = "Hot"
}

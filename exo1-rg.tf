# Create a resource group
resource "azurerm_resource_group" "rg" {
  name = var.AZURE_RESSOURCE_NAME
  location = var.AZURE_RESSOURCE_LOCATION
}

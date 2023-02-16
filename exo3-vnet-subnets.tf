# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name = "${var.AZURE_RESSOURCE_NAME}-vnet"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create 2 subnet
resource "azurerm_subnet" "subnet" {
  for_each = var.AZURE_SUBNETS_CONFIG
  name = "${var.AZURE_RESSOURCE_NAME}-subnet-${each.key}"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = each.value.ip_address
}


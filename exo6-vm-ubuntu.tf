# Create a publicIp
resource "azurerm_public_ip" "publicIp" {
  name = "publicIP-clementd"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Static"
}

# Create a network interface (~~ carte réseaux de la machine virtuelle)
resource "azurerm_network_interface" "networkInterface" {
  name = "network-interface-clementd"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name = "testConfiguration"
    subnet_id = azurerm_subnet.subnet[1].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id  = azurerm_public_ip.publicIp.id
  }
}

# Create a linux virtual machine
resource "azurerm_virtual_machine" "vm" {
  count  = 1
  name = "${var.AZURE_RESSOURCE_NAME}-vm-ubuntu-${count.index}"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  network_interface_ids = [element(azurerm_network_interface.networkInterface.*.id, count.index)]
  vm_size = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "16.04-LTS"
    version = "latest"
  }

  storage_os_disk {
    name = "diskos_${count.index}"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Optional data disks
  storage_data_disk {
    name = "vm_${count.index}_diskdata"
    managed_disk_type = "Standard_LRS"
    create_option = "Empty"
    lun = 0
    disk_size_gb = "1023"
  }

  os_profile {
    computer_name = "vm-clementd-${count.index}"
    admin_username = "testAdmin"
    admin_password = "Salut123!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

# To connect to the VM:
# ssh testAdmin@<public_ip_address>
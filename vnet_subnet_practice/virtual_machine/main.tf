resource "azurerm_network_interface" "nic001" {
  name                = var.nic001
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/2562dcdc-5d01-45bf-ae8d-f2d8ce0e8473/resourceGroups/prod-rg01/providers/Microsoft.Network/virtualNetworks/prod-vnet01/subnets/prod-frontendsubnet001"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "frontend-vm001" {
  name                = var.virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_d2as_v5"
  admin_username      = "adminuser@123"
  admin_password = "password@1234"
  disable_password_authentication=false
  network_interface_ids = [
    azurerm_network_interface.nic001.id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
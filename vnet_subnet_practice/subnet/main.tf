resource "azurerm_subnet" "subnet001" {
  name                 = var.subnet001
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
  
}




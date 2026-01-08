module "resorce_group" {
    source = "../resource_group"
    resource_group_name="prod-rg01"
    location="central india"

  
}




module "resorce_group" {
    source = "../resource_group"
    resource_group_name="prod-rg06"
    location="central india"



}
module "resorce_group" {
    source = "../resource_group"
    resource_group_name="prod-rg02"
    location="central india"

  
}
module "resorce_group" {
    source = "../resource_group"
    resource_group_name="prod-rg04"
    location="central india"

  
}












module "resorce_group1" {
    source = "../resource_group"
    resource_group_name="prod-rg03"
    location="central india"

  
}



module "virtual_network" {
    depends_on = [ module.resorce_group ]
    source = "../virtual_network"
    vnet_name="prod-vnet01"
    location="central india"
    resource_group_name="prod-rg01"

  address_space=["10.0.0.0/16"]
}

module "frontend-subnet" {
  depends_on = [ module.virtual_network ]

  source = "../subnet"
  subnet001="prod-frontendsubnet001"
  resource_group_name="prod-rg01"
  vnet_name="prod-vnet01"
  address_prefixes=["10.0.1.0/24"]
  
}

module "backend-subnet" {
  depends_on = [ module.virtual_network ]
  source = "../subnet"
  subnet001="prod-backendsubnet001"
  resource_group_name="prod-rg01"
  vnet_name="prod-vnet01"
  address_prefixes=["10.0.2.0/24"]
  
}

module "virtual_machine" {
  source = "../virtual_machine"
  nic001="nic-prod"
  location="central india"
  resource_group_name="prod-rg01"
  virtual_machine_name="frontend-vm001"
  
  
}
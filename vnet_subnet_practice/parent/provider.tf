terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
  subscription_id = "2562dcdc-5d01-45bf-ae8d-f2d8ce0e8473"
}
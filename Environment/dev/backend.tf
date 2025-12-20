terraform {

  backend "azurerm" {
    resource_group_name  = "dev-tfstate-rg"
    storage_account_name = "devtfstatebackend09876"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
    
  }

}
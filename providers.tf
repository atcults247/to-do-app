provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.22.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name   = "azDevTFTestRG01"
    storage_account_name  = "cirazadopstest01"
    container_name        = "tfstate-dev"
    key                   = "terraform.tfstate"
  }
}
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

  tags = {
    purpose = "test"
    purpose2 = "testing"
  }
}


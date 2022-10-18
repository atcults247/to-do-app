resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location

  tags = {
    purpose = "dev-testing"
    purpose2 = "testing2"
  }
}

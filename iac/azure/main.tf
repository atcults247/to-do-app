resource "azurerm_resource_group" "rg" {
  name     = "to-do-rg"
  location = "west india"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "todostoragetf1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "todocontainertf"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "storage_blob" {
  name                   = "todostoragecontainerblobtf"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
}

resource "azurerm_virtual_network" "virtual_network" {
  name                = "todovirtualnettf"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  
  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = "AzureSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
}


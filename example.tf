terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

provider "azurerm" {
     features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "example-cosmos"
  location = "eastus"
}

resource "azurerm_cosmosdb_account" "db" {
  name = "tutorialcosmosdb2"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  offer_type = "Standard"
  kind = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }
  
  geo_location {
    location = azurerm_resource_group.rg.location
    failover_priority = 0
  }

}
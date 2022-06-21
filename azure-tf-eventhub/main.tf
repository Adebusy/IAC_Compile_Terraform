terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.3.0"
    }
  }
}

provider "azurerm" {
  #  alias = "azDevTestEnterprise"--
  #  subscription_id ="a36e9f4a-97d4-4523-91bf-88d84b9c57ed"
  #  tenant_id = "f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"
  #  client_id = "b832ac96-13f3-46a3-8eef-725397c3df0f"
  features {}
}

data "azurerm_resource_group" "devtest_ResourceGroup" {
  name = "${var.resource_group_name}"
}


resource "azurerm_eventhub_namespace" "devtest_eventhub_namespace" {
  name                = "${var.eventhub_namespace}"
  location            = data.azurerm_resource_group.devtest_ResourceGroup.location
  resource_group_name = data.azurerm_resource_group.devtest_ResourceGroup.name
  sku                 = "Standard"
  capacity            = 1

  tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}

resource "azurerm_eventhub" "devetest_eventhub" {
  name                = "${var.eventhub_name}"
  namespace_name      = azurerm_eventhub_namespace.devtest_eventhub_namespace.name
  resource_group_name = data.azurerm_resource_group.devtest_ResourceGroup.name
  partition_count     = 2
  message_retention   = 1
}
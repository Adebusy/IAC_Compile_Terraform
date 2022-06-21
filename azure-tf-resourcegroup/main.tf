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

resource "azurerm_resource_group" "rg_name"{
  name = "${var.az_resource_group_name}"
  location = "${var.location}"
  tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}

output "resource_group_name" {
  value = azurerm_resource_group.rg_name.name
}

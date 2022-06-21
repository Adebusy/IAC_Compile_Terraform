terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.3.0"
    }
  }
}

provider "azurerm" {
  # alias = "testsub"
  # subscription_id ="a36e9f4a-97d4-4523-91bf-88d84b9c57ed"
  # tenant_id = "f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"
  # client_id = "b832ac96-13f3-46a3-8eef-725397c3df0f"
  features {}
}


data "azuread_client_config" "current" {}

resource "azuread_application" "spapplication" {
  display_name = "${var.service_principal_application_name}"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "svc_principal" {
  application_id               = azuread_application.spapplication.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]

  feature_tags {
    enterprise = true
    gallery    = true
  }
  }

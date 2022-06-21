# Create storage account for boot diagnostics
resource "azurerm_storage_account" "storageaccount" {
  name                     = "${var.Azure_storage_account}"
  resource_group_name      = data.azurerm_resource_group.Data_Resource_group.name
  location                 = data.azurerm_resource_group.Data_Resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

    tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}

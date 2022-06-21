variable "location" {
  default = "West US"
  type = string
}

variable "test_Key_Vault_name" {
  default = "testkv-uw-iac-dev01"
  type = string
}

variable "az_resource_group_name" {
  default = "rg-uw-devops-sandbox"
  type = string
  description = "Kindly follow the naming convention rg-region-type-workload-environment with dashes rg-uw-devops-sandbox"
}

# variable "az_Dev_Test_resource_group" {
#   type = map
#   default = {
#       "AzureBackup" = "AzureBackupRG_westus_1"
#       "NetworkWatcher" = "NetworkWatcherRG"
#       "RetailDev" = "rg-uw-boost-retail-dev"
#   }
# }

variable "tag_cost_center" {
  type = string
  description = "Enter the tag cost center here"
  default = "901105"
}

variable "tag_environment" {
  type = string
  description = "Enter the tage environment here"
  default = "NONPRODUCTION"
}

variable "tag_application" {
  type = string
  description = "Enter the tag application here"
  default = "DEVOPS-SANDBOX"
}

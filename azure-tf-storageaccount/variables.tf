# variable "az_Dev_Test_resource_group" {
#   type = map
#   default = {
#       "AzureBackup" = "AzureBackupRG_westus_1"
#       "NetworkWatcher" = "NetworkWatcherRG"
#       "RetailDev" = "rg-uw-boost-retail-dev"
#   }
# }


variable "Resource_group" {
   default = "rg-uw-devops-sandbox"
   type = string
   description = "Enter the  existing resource group name here"
  # type = map
  # default = {
  #     "AzureBackup" = "AzureBackupRG_westus_1"
  #     "NetworkWatcher" = "NetworkWatcherRG"
  #     "RetailDev" = "rg-uw-boost-retail-dev"
  # }
}

variable "Storage_Account_Name" {
    default = "sauwvmomsprodcor"
    type = string
    description = "Kindly follow the naming convention <company><region><type><workload><role><environment>.core.windows.net e.g. sauwvmomsprod.core.windows.net"
}

variable "tag_cost_center" {
  type = string
  description = "Enter the tag cost center here"
  default = "901105"
}

variable "tag_environment" {
  type = string
  description = "Enter the tag environment here"
  default = "NONPRODUCTION"
}

variable "tag_application" {
  type = string
  description = "Enter the tag application here"
  default = "DEVOPS-SANDBOX"
}


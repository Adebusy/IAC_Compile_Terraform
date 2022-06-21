variable "az_DevTest_Enterprise_resource_group" {
  default = "rg-uw-devops-sandbox"
  type = string
  description = "Kindly follow the naming convention sbq-region-type-workload-environment and input existing resource group's name"
}

variable "az_DevTest_Enterprise_App_Service_Plan_Name" {
  default = "as-uw-marlin-marlinnetwork-stagingserviceplan"
  type = string
  description = "Kindly follow the naming convention asp-region-workload-environment and input existing app service plan's name"
}

variable "az_DevTest_Enterprise_App_Service_Name" {
  default = "as-usc-appdev-advantagesolutions"
  type = string
  description = "Kindly follow the naming convention as-region-type-workload-environment  as  as-usc-appdev-advantagesolutions"
}

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
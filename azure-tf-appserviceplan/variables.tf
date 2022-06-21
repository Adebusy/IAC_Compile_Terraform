variable "az_DevTest_resource_group_name" {
  default = "rg-uw-devops-sandbox"
  type = string
}

variable "az_DevTest_App_Service_Plan_Name" {
  default = "asp-usc-wordpress-external-nonprod"
  type = string
  description = "Kindly follow the naming convention asp-region-workload-environment with dashes asp-usc-wordpress-external-nonprod"
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

variable "os_type" {
  type = string
  description = "App service plan OS type must be Linux, Windows, or WindowsContainer"
  default = "Windows"
}



variable "az_resource_group_name" {
  default = "rg-uw-devops-sandbox"
  type = string
  description = "Kindly follow the naming convention rg-region-type-workload-environment with dashes rg-uw-devops-sandbox"
}
variable "service_principal_application_name" {
  default = "sa-uw-app"
  type = string
  description = "Enter the  resource group location here"
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
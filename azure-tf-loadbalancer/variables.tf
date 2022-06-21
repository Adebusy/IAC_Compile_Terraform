variable "Resource_group" {
  type    = string
  default = "rg-uw-devops-sandbox"
  description = "Enter the existing resource group name here"
}

variable "LoadBalancer_name" {
  type    = string
  default = "sql-uw-appdev-general-devtest"
  description = "Kindly follow the naming convention plb-region-workload-environment with dashes plb-uw-web-prod"
}

variable "PublicIPForLB_name" {
  type    = string
  default = "uwnetbigip-mgmt-pip"
  description = "Kindly follow the naming convention <virtualMachineName>-mgmt-pip  with dashes uwnetbigip-mgmt-pip"
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


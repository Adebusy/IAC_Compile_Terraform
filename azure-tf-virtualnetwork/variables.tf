variable "resource_group" {
  default = "rg-uw-devops-sandbox"
  type = string
}

variable "NSG_Name" {
  default = "nsg-uw-vm-oms-web-dev-test"
  type = string
}

variable "VNet_Name" {
  default = "vnet-uw-vm-oms-web-dev-test"
  type = string
}

variable "VNet_address_space" {
  default = "10.0.0.0/16"
  type = string
}

variable "Subnet1" {
  default = "10.0.1.0/24"
  type = string
}

variable "Subnet2" {
  default = "10.0.2.0/24"
  type = string
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


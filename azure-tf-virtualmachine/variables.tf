variable "Deployment" {
  type    = string
  default = "dep-testdeploy"
}

variable "Resource_group" {
  type    = string
  default = "rg-uw-devops-sandbox"
  description = "Enter the test resource group's name here"
}

variable "Virtual_network_name" {
  type    = string
  default = "vnet-uw-nonprod"
 description = "Enter the test virtual network name here"
}

# variable "Virtual_subnet_name" {
#   type    = string
#   default = "testsubnet"
#   description = "Enter the test virtual subnet here"
# }

variable "Virtual_network_address_space" {
  type    = list(string)
  default = ["10.0.2.0/24"]
  description = "Enter the test virtual network address space here"
}

variable "Virtual_network_subnet" {
  type    = list(string)
  default = ["10.0.2.0/24"]
  description = "Enter the test subnet here"
}

variable "NIC" {
  type    = string
  default = "test_NIC"
  description = "Enter the test network interface name here"
}

variable "Azure_storage_account"{
  type    = string
  default = "strsauwvmomsprod"
  description ="can only consist of lowercase letters and numbers, and must be between 3 and 24 characters long"
}
variable "Virtual_machine_name" {
  type    = string
  default = "vm-test-server"
  description = "Kindly follow the naming convention <region><app><role><environment><number> without <> UWOMSGWD1"
}

variable "Admin_username" {
  type    = string
  default = "adminuser"
  description = "Enter the test virtual machine admin username here"
}

variable "Admin_password" {
  type    = string
  default = "P@55w0rd"
  description = "Enter the test virtual machine password here"
}

variable "Network_security_group_name" {
  type    = string
  default = "myNetworkSecurityGroup"
  description = "Enter the  network security group name here"
}

variable "listener_arn" {
  type    = string
  default = "networkarn"
  description = "Enter the test listener arn name here"
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

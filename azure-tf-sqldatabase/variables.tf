variable "Dev_Test_Resource_group" {
  type    = string
  default = "rg-uw-devops-sandbox"
  description = "Enter the existing resource group name here"
}

variable "DevTest_azurerm_mssql_server_name" {
  type    = string
  default = "sql-uw-appdev-general-devtest"
  description = "Kindly follow the naming convention sql-region-type-workload-environment with dashes sql-uw-appdev-general-devtest"
}


variable "DevTest_mssql_server_admin_password" {
  type    = string
  default = "P@55w0rd123"
  description = "Enter the server admin's password here"
}

variable "DevTest_mssql_server_admin_login" {
  type    = string
  default = "devtestuser"
  description = "Enter the admin username's here"
}

variable "DevTest_azurerm_mssql_databse_name" {
  type    = string
  default = "devtestuser"
  description = "Enter the database's name here"
}



# provider "azurerm" {
#   alias = "azDevTestEnterprise"
#   subscription_id ="a36e9f4a-97d4-4523-91bf-88d84b9c57ed"
#   tenant_id = "f96ae7b7-2a22-43a5-9357-a82ad6b9cb73"
#   client_id = "b832ac96-13f3-46a3-8eef-725397c3df0f"
#   skip_provider_registration = "true"
#   features {}
# }

 provider "azurerm" {
   skip_provider_registration = "true"
   features {}
 }


data "azurerm_resource_group" "Data_Resource_group" {
  name = var.Resource_group
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "az_group_association" {
  network_interface_id      = azurerm_network_interface.test_NIC.id
  network_security_group_id = azurerm_network_security_group.az_security_group.id
} 

resource "azurerm_linux_virtual_machine" "resource_Virtual_Machine" {
  name = var.Virtual_machine_name
  resource_group_name = data.azurerm_resource_group.Data_Resource_group.name
  location            = data.azurerm_resource_group.Data_Resource_group.location
  size                = "Standard_DS1_v2"
  network_interface_ids = [
    azurerm_network_interface.test_NIC.id,
  ]
  computer_name                   = var.Virtual_machine_name
  admin_username                  = var.Admin_username
  disable_password_authentication = true

  os_disk {
    name                 = "${var.Virtual_machine_name}-dsk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_ssh_key {
    username   = var.Admin_username
    public_key = tls_private_key.example_ssh.public_key_openssh
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storageaccount.primary_blob_endpoint
  }
  tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}

output "admin_username" {
  value = "Username : ${azurerm_linux_virtual_machine.resource_Virtual_Machine.name}"
}

output "admin_password" {
  value = "Password : ${var.Admin_password}"
}

output "public_ip_address" {
  value = "Public IP address : ${azurerm_linux_virtual_machine.resource_Virtual_Machine.public_ip_address}"
}

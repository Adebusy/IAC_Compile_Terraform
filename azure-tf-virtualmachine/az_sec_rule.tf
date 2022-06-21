resource "azurerm_network_security_group" "az_security_group" {
  name                = "${var.Network_security_group_name}"
  location            = data.azurerm_resource_group.Data_Resource_group.location
  resource_group_name = data.azurerm_resource_group.Data_Resource_group.name

  security_rule {
    name                       = "HTTPS"
    priority                   = "202"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "SSH"
    priority                   = "201"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

    tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}

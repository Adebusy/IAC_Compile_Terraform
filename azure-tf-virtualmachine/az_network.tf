resource "azurerm_virtual_network" "test_VNet" {
  name                = "${var.Virtual_network_name}-${var.Virtual_machine_name}"
  address_space       = var.Virtual_network_address_space
  location            = data.azurerm_resource_group.Data_Resource_group.location
  resource_group_name = data.azurerm_resource_group.Data_Resource_group.name
}

resource "azurerm_subnet" "test_SN" {
  name                 = "${var.Virtual_machine_name}-vir-sub"
  resource_group_name  = data.azurerm_resource_group.Data_Resource_group.name
  virtual_network_name = azurerm_virtual_network.test_VNet.name
  address_prefixes     = var.Virtual_network_subnet
  
}
# Create public IPs uwnetbigip-ext-pip

resource "azurerm_public_ip" "publicip" {
  name                = "${var.Virtual_machine_name}-ext-pip"
  location            = data.azurerm_resource_group.Data_Resource_group.location
  resource_group_name = data.azurerm_resource_group.Data_Resource_group.name
  allocation_method   = "Dynamic"
  tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}
#create NIC for network
resource "azurerm_network_interface" "test_NIC" {
  name                = "${var.NIC}"
  location            = data.azurerm_resource_group.Data_Resource_group.location
  resource_group_name = data.azurerm_resource_group.Data_Resource_group.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.test_SN.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }

  tags = {
      "APPLICATION" = "${var.tag_application}"  
    "COSTCENTER" = "${var.tag_cost_center}"
    "ENVIRONMENT" = "${var.tag_environment}"
  }
}

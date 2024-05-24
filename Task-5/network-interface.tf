resource "azurerm_network_interface" "network-interface" {
    name = "vm-nic"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name

    ip_configuration {
        name = "internal"
        subnet_id = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.publicIp.id
    }
}
resource "azurerm_public_ip" "publicIp" {
  name                = "virtual-network-gateway-ip"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  sku = "Standard"
  allocation_method = "Static"
}


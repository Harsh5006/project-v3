resource "azurerm_virtual_network" "vnet" {
    name = var.virtual_network_name
    address_space = var.virtual_network_address_space
    location = var.resources_location
    resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_subnet" "subnet" {
    name = "internal"
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.subnet_prefix
}
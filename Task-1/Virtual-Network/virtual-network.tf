resource "azurerm_virtual_network" "vnet" {
    name = var.virtual_network_name
    address_space = var.virtual_network_address_space
    location = var.resources_location
    resource_group_name = azurerm_resource_group.myrg.name
    
    subnet {
        name = var.subnet1_name
        address_prefix = var.subnet1_address_prefix 
    }
}
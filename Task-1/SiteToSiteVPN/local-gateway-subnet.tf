resource "azurerm_local_network_gateway" "onpremise" {
    name = "onpremise"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
    gateway_address = var.gateway_address
    address_space = var.local_gateway_address_space
}
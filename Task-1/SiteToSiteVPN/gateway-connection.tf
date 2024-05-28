resource "azurerm_virtual_network_gateway_connection" "onpremise" {
    name = "onpremise"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name

    type = "IPsec"
    virtual_network_gateway_id = azurerm_virtual_network_gateway.gateway.id
    local_network_gateway_id = azurerm_local_network_gateway.onpremise.id

    shared_key = "test-key"
}
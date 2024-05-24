resource "azurerm_container_group" "container-group"{
    name = "container-group"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
    sku = "Standard"
    ip_address_type = "Public"
    os_type = "Linux"


    container {
        name = "hello-world"
        image = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
        cpu = "1"
        memory = "1.5"


        ports {
            port = 443
            protocol = "TCP"
        }
    }
}
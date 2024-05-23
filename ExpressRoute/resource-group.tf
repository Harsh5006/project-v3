resource "azurerm_resource_group" "myrg" {
    name = var.resource_group_name
    location = var.resources_location
}

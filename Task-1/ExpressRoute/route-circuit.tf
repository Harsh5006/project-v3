resource "azurerm_express_route_circuit" "express-route" {
  name                  = "expressRoute1"
  resource_group_name   = azurerm_resource_group.myrg.name
  location              = azurerm_resource_group.myrg.location
  service_provider_name = "Airtel"
  peering_location      = "Mumbai2"
  bandwidth_in_mbps     = 50

  sku {
    tier   = "Standard"
    family = "MeteredData"
  }
}
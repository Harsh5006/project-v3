resource "azurerm_public_ip" "ipForLB" {
    name = "PublicIPForLB"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
    allocation_method = "Static"
    sku = "Standard"
}

resource "azurerm_lb" "load-balancer"{
    name = "LoadBalancer"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
    sku = var.loadBalancerSKU

    frontend_ip_configuration {
        name = var.public_ip_name
        public_ip_address_id = azurerm_public_ip.ipForLB.id
    }
}

resource "azurerm_lb_backend_address_pool" "my_lb_pool" {
    loadbalancer_id = azurerm_lb.load-balancer.id
    name = "BackEndAddressPool"
}
resource "azurerm_network_interface_backend_address_pool_association" "association" {
  network_interface_id    = "${azurerm_network_interface.network-interface.id}"
  ip_configuration_name   = "internal"
  backend_address_pool_id = "${azurerm_lb_backend_address_pool.my_lb_pool.id}"
}

resource "azurerm_lb_probe" "my_lb_probe" {
    loadbalancer_id = azurerm_lb.load-balancer.id
    name = "test-probe"
    port = 80
}

resource "azurerm_lb_rule" "my_lb_rule"{
    loadbalancer_id = azurerm_lb.load-balancer.id
    name = "test-rule"
    protocol = "Tcp"
    frontend_port = 80
    backend_port = 80
    frontend_ip_configuration_name = var.public_ip_name
    probe_id = azurerm_lb_probe.my_lb_probe.id
    backend_address_pool_ids = [azurerm_lb_backend_address_pool.my_lb_pool.id]
}


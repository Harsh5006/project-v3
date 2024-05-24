resource "azurerm_public_ip" "publicIp" {
  name                = "virtual-network-gateway-ip"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "gateway" {
  name                = "virtual-network-gateway"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "Basic"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.publicIp.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gatewaySubnet.id
  }

  vpn_client_configuration {
    address_space = ["10.2.0.0/24"]

    root_certificate {
      name = "Root-CA"

      public_cert_data = <<EOF
MIIC3zCCAcegAwIBAgIQdhCT8aLEI6RH0Pdx+D//mDANBgkqhkiG9w0BAQsFADAS
MRAwDgYDVQQDDAdWUE5Sb290MB4XDTI0MDUxNTEwMDMxNVoXDTI1MDUxNTEwMjMx
NVowEjEQMA4GA1UEAwwHVlBOUm9vdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAPEULMzvfyT03x/K4Ev6TnIn1e/eqNI3J5xSntKLMWh9+c8492iA+SyA
IK0dBH84bXAoIStC1peXitr0ix3qpG7ZiZp42aFToFhRlp7ty8Rwh5L9B7qAzWuV
LMAKnUUxTJDJ+VPjRm3iFHWYM059tY8hD8mFzawQow8+u7v23XQEg51ZkmMUZRYQ
8QghTRS8rVcxFKB/6oMdEzSkmzfjhGy50W9795UXkb6a9SW2ISKDb46RZC9CUZB+
hCCEU65KS6DFnL5jmW6AwlCerC32En7NyIDwG4RunAEIXNAF/AWdFSXwDqKpliPN
/CJn5HB20mKc2lapAxXNnXHktc+87eECAwEAAaMxMC8wDgYDVR0PAQH/BAQDAgIE
MB0GA1UdDgQWBBTNPL/9L9Afh2E5LwJscnrd5YcV3DANBgkqhkiG9w0BAQsFAAOC
AQEAARpxglwsxO72Npuhp+bW2tS9BPh1SREN5VCAfYSxVIKNpTPuJKQ8lP6fu5G9
zoUn0A82G+Qz/7GCmiSxaXG7cUrpkKqwxoASD8iWLMQ1PAo6IEnBHAirI1xxPweB
5+m2nvldnqn5dk7W2j3hkUHUBhV9rKhyvrqR3sFqZ78CjxhzaX4T6p3npwYD8QTa
n7QsniIPB5pZlzjDg4zYC6OAju60sqgwPP+Ht7SP1oOog1YQD53iMJmYBn7WkiCC
dLdgvs/8nadhaksDcR2JWFteFUU+77oe0mCeL6ZpsCi0jAmooc2xYfowUyOYjBnd
pq6O3ccfgDMeuRg3HzM7sKtqXg==
EOF
    }
  }
}
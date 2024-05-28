variable "resource_group_name"{
    type = string
}
variable "resources_location" {
    type = string
}
variable "virtual_network_name" {
    type = string
}
variable "virtual_network_address_space" {
    type = list(string)
}
variable "gateway_subnet_address_prefix" {
    type = list(string)
}
variable "gateway_address" {
    type = string
}
variable "local_gateway_address_space" {
  type = list(string)
}
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
variable "subnet_prefix" {
    type = list(string)
}
variable "loadBalancerSKU" {
    type = string
}
variable "public_ip_name"{
    type = string
}
variable "admin_username" {
  type    = string
}

variable "admin_password" {
  type    = string
}

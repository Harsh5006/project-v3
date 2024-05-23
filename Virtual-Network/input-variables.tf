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
variable "subnet1_address_prefix"{
    type = string
}
variable "subnet1_name" {
    type = string
}
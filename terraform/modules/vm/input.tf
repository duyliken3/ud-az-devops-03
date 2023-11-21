
variable "location" {}
variable "resource_group" {}
variable "prefix" {}
variable "public_ip_address_id" {}
variable "subnet_id" {}
variable "vm_password" {
    default = "tQ=~cGqN;z[(,6:3"
}
variable "admin_username" {}
variable "public_key_path" {
    default = "/home/vsts/work/_temp/id_rsa.pub"
}
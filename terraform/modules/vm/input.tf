
variable "location" {}
variable "resource_group" {}
variable "prefix" {}
variable "public_ip_address_id" {}
variable "subnet_id" {}
variable "vm_password" {
    default = "th3_flatw0rld"
}
variable "admin_username" {}
variable "public_key_path" {}
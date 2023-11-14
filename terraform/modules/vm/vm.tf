resource "azurerm_network_interface" "" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "" {
  name                = "${var.prefix}-vm"
  location            = var.location
  resource_group_name = var.resource_group
  size                = "Standard_B1s"
  admin_username                  = "ud-devops"
  admin_password                  = var.vm_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = "vm-admin"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD4mXDpKdMaocOF/QWCKOnH/uvMYblL5P2tz2JjiP5p8mYFxOl+SerA5HaTzfe9TlXqwAoYbrs+HbYVe+M1pERDGQWtKxEUp+SbceuEPS+TqRZCSHcl2WyUj2bZdFqyJavRidZZxBDjlG+mkeQd+LOh0xDx9M0xru462r7VaIv1Kcc5WkYWDqjsVyqysS53o0lPjZ9djt+YpsfWrr5eyB8b9B3VPHHHpXWvtZTEWYQSYtotRwb9Mo+862E+wQpBUVs5vjEhbDOEWjT4Ti34Ag7vrhPKG8qIxVvdD0H8yclZrelRLzYlqdS/XX81TdHQgWmhJWhB2vL0aBPhaJZR76uj%"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

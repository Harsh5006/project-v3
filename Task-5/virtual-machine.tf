resource "azurerm_windows_virtual_machine" "myvm" {
    name = "myvm"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location

    size = "Standard_F2"
    admin_username = var.admin_username
    admin_password = var.admin_password
    network_interface_ids = [
        azurerm_network_interface.network-interface.id,
    ]
    
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer = "WindowsServer"
        sku = "2016-Datacenter"
        version = "latest"
    }
}
# resource "azurerm_virtual_machine_extension" "script-extension" {
#   name                 = "hostname"
#   virtual_machine_id   = azurerm_windows_virtual_machine.myvm.id
#   publisher = "Microsoft.Compute"
#   type = "CustomScriptExtension"
#   type_handler_version       = "1.9"

#   settings = <<SETTINGS
#  {
#   "commandToExecute": "powershell -encodedCommand ${textencodebase64(file("${path.module}/custom-script.ps1"), "UTF-16LE")}"
#  }
# SETTINGS
# }
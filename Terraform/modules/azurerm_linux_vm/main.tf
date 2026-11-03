data "azurerm_key_vault" "main" {
  name                = "maddy"
  resource_group_name = "rg-abc-elearn-prod-cin-001"
  
}

data "azurerm_key_vault_secret" "admin_username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.main.id
}

data "azurerm_network_interface" "todo_nic"  {
  for_each = var.ch_vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_linux_virtual_machine" "todo_vm" {
  for_each = var.ch_vms
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = data.azurerm_key_vault_secret.admin_username.value
  admin_password =  data.azurerm_key_vault_secret.admin_password.value
  disable_password_authentication = each.value.disable_password_authentication

  network_interface_ids = [
    data.azurerm_network_interface.todo_nic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }

  
}

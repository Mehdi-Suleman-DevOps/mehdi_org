data "azurerm_network_interface" "todo_nic" {
  for_each = var.ch_nisg
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_security_group" "todo_nsg" {
  for_each = var.ch_nisg
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
  for_each = var.ch_nisg
  network_interface_id = data.azurerm_network_interface.todo_nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.todo_nsg[each.key].id
}
data "azurerm_subnet" "todo_subnet" {
  for_each            = var.ch_nics
  name                = each.value.nic_subnet_name
  virtual_network_name = each.value.nic_virtual_network_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_security_group" "todo_nsg" {
  for_each            = var.ch_nics
  name                = each.value.nic_network_security_group_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_interface" "todo_nic" {
  for_each            = var.ch_nics
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.nic_ip_config_name
    subnet_id                     = data.azurerm_subnet.todo_subnet[each.key].id
    private_ip_address_allocation = each.value.nic_private_ip_address_allocation
    private_ip_address            = data.azurerm_subnet.todo_subnet[each.key].id
  }

 
}

data "azurerm_subnet" "subnet" {
  for_each = var.ch_bastions
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
  
}

data "azurerm_public_ip" "pip" {
  for_each = var.ch_bastions
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_bastion_host" "todo" {
  for_each = var.ch_bastions
  name                = each.value.bastion_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  ip_configuration {
    name                 = each.value.ip_configuration_name
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
  
}
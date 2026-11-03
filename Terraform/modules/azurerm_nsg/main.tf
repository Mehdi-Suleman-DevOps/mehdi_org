resource "azurerm_network_security_group" "todo_nsg" {
  for_each            = var.ch_nsgs
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = each.value.nsg_rule_name
    priority                   = each.value.nsg_rule_priority
    direction                  = each.value.nsg_rule_direction
    access                     = each.value.nsg_rule_access
    protocol                   = each.value.nsg_rule_protocol
    source_port_range          = each.value.nsg_rule_source_port_range
    destination_port_range     = each.value.nsg_rule_destination_port_range
    source_address_prefix      = each.value.nsg_rule_source_address_prefix
    destination_address_prefix = each.value.nsg_rule_destination_address_prefix
  }
  
}


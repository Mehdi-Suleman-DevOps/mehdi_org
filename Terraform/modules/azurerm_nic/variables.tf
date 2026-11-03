variable "ch_nics" {
  description = "A map of NICs to create"
  type = map(object({
    nic_name                          = string
    location                          = string
    resource_group_name               = string
    nic_ip_config_name                = string
    nic_private_ip_address_allocation = string
    nic_subnet_name                   = string
    nic_virtual_network_name          = string
    nic_network_security_group_name    = string
  }))
}
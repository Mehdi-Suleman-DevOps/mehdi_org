variable "pr_rgs" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "pr_stgs" {
  type = map(object({
    resource_group_name = string
    location            = string
    stg_name            = string
    replication_type    = string
    account_tier        = string
  }))
}

variable "pr_vnets" {
  type = map(object({
    resource_group_name = string
    location            = string
    vnet_name           = string
    address_space       = list(string)
  }))
}

variable "pr_subnets" {
  type = map(object({
    resource_group_name = string
    vnet_name           = string
    subnet_name         = string
    address_prefixes    = list(string)
  }))
}


variable "pr_pips" {
  type = map(object({
    resource_group_name = string
    location            = string
    public_ip_name      = string
  }))
}


variable "pr_nsgs" {
  type = map(object({
    resource_group_name                 = string
    location                            = string
    nsg_name                            = string
    nsg_rule_name                       = string
    nsg_rule_priority                   = number
    nsg_rule_direction                  = string
    nsg_rule_access                     = string
    nsg_rule_protocol                   = string
    nsg_rule_source_port_range          = string
    nsg_rule_destination_port_range     = string
    nsg_rule_source_address_prefix      = string
    nsg_rule_destination_address_prefix = string
  }))
}



variable "pr_nics" {
  description = "A map of NICs to create"
  type = map(object({
    nic_name                          = string
    location                          = string
    resource_group_name               = string
    nic_ip_config_name                = string
    nic_private_ip_address_allocation = string
    nic_subnet_name                   = string
    nic_virtual_network_name          = string
    nic_network_security_group_name   = string
  }))
}


variable "ch_vms" {
  description = "A map of virtual machines to create"
  type = map(object({
    vm_name                         = string
    resource_group_name             = string
    location                        = string
    vm_size                         = string
    disable_password_authentication = bool
    image_publisher                 = string
    image_offer                     = string
    image_sku                       = string
    image_version                   = string
    nic_name                        = string

  }))

}

variable "ch_nisg" {
  type = map(object({
    resource_group_name = string
    nic_name            = string
    nsg_name            = string
  }))
}

variable "ch_bastions" {
  type = map(object({
    bastion_name          = string
    resource_group_name   = string
    location              = string
    vnet_name             = string
    subnet_name           = string
    ip_configuration_name = string
    pip_name              = string
  }))
}


variable "ch_sql" {
  type = map(object({
    server_name                   = string
    sql_database_name                 = string
    resource_group_name           = string
    location                      = string
    version                       = string
    minimum_tls_version           = string
    public_network_access_enabled = bool
    sku_name                      = string
    max_size_gb                   = number
    zone_redundant                = bool
  }))
}
pr_rgs = {
  rg1 = {
    name     = "dev_rg1"
    location = "eastus"
  }
}

pr_stgs = {
  stg1 = {
    resource_group_name = "dev_rg1"
    location            = "eastus"
    stg_name            = "stgmerahai"
    replication_type    = "LRS"
    account_tier        = "Standard"
  }
}

pr_vnets = {
  vnet1 = {
    resource_group_name = "dev_rg1"
    location            = "eastus"
    vnet_name           = "vnet1"
    address_space       = ["192.168.0.0/16"]
  }
}

pr_subnets = {
  subnet1 = {
    resource_group_name = "dev_rg1"
    vnet_name           = "vnet1"
    subnet_name         = "subnet1"
    address_prefixes    = ["192.168.1.0/24"]
  }
  subnet2 = {
    resource_group_name = "dev_rg1"
    vnet_name           = "vnet1"
    subnet_name         = "subnet2"
    address_prefixes    = ["192.168.2.0/24"]
  }
  subnet3 = {
    resource_group_name = "dev_rg1"
    vnet_name           = "vnet1"
    subnet_name         = "AzureBastionSubnet"
    address_prefixes    = ["192.168.3.0/24"]
  }
}

pr_pips = {
  pip1 = {
    resource_group_name = "dev_rg1"
    location            = "eastus"
    public_ip_name      = "pip1"
  }
  pip2 = {
    resource_group_name = "dev_rg1"
    location            = "eastus"
    public_ip_name      = "pip2"
  }
}

pr_nsgs = {
  nsg1 = {
    resource_group_name                 = "dev_rg1"
    location                            = "eastus"
    nsg_name                            = "nsg1"
    nsg_rule_name                       = "nsg_rule1"
    nsg_rule_priority                   = 100
    nsg_rule_direction                  = "Inbound"
    nsg_rule_access                     = "Allow"
    nsg_rule_protocol                   = "Tcp"
    nsg_rule_source_port_range          = "*"
    nsg_rule_destination_port_range     = "22"
    nsg_rule_source_address_prefix      = "*"
    nsg_rule_destination_address_prefix = "*"
  }
}

ch_vms = {
  vm1 = {
    vm_name                         = "vm1"
    resource_group_name             = "dev_rg1"
    location                        = "eastus"
    vm_size                         = "Standard_D2nlds_v6"
    disable_password_authentication = false
    image_publisher                 = "Canonical"
    image_offer                     = "0001-com-ubuntu-server-jammy"
    image_sku                       = "22_04-lts-gen2"
    image_version                   = "latest"
    nic_name                        = "nic1"

  }
}

pr_nics = {
  "nics1" = {
    nic_name                          = "nic1"
    location                          = "eastus"
    resource_group_name               = "dev_rg1"
    nic_ip_config_name                = "ipconfig1"
    nic_private_ip_address_allocation = "Dynamic"
    nic_subnet_name                   = "subnet1"
    nic_virtual_network_name          = "vnet1"
    nic_network_security_group_name   = "nsg1"
  }
}

ch_nisg = {
  nisg1 = {
    resource_group_name = "dev_rg1"
    nic_name            = "nic1"
    nsg_name            = "nsg1"
  }
}

ch_bastions = {
  bastion1 = {
    bastion_name          = "bastion1"
    resource_group_name   = "dev_rg1"
    location              = "eastus"
    vnet_name             = "vnet1"
    subnet_name           = "AzureBastionSubnet"
    ip_configuration_name = "ipconfig1"
    pip_name              = "pip2"
  }
}

ch_sql = {
  sql1 = {
    server_name                   = "sql1"
    resource_group_name           = "dev_rg1"
    location                      = "eastus2"
    version                       = "12.0"
    minimum_tls_version           = "1.2"
    public_network_access_enabled = true
    sql_database_name             = "sqldb1"
    sku_name                      = "S0"
    max_size_gb                   = 10
    zone_redundant                = false
  }
}
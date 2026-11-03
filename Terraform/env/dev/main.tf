module "azurerm_resource_group" {
  source = "../../modules/azurerm_resource_group"
  ch_rgs = var.pr_rgs
}

module "azurerm_storage_account" {
  source  = "../../modules/azurerm_storage_account"
  ch_stgs = var.pr_stgs
}

module "azurerm_virtual_network" {
  source     = "../../modules/azurerm_virtual_network"
  ch_vnet    = var.pr_vnets
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_subnets" {
  source     = "../../modules/azurerm_subnets"
  ch_subnets = var.pr_subnets
  depends_on = [module.azurerm_virtual_network]
}

module "azurerm_public_ip" {
  source  = "../../modules/azurerm_public_ip"
  ch_pips = var.pr_pips
}

module "azurerm_network_security_group" {
  source  = "../../modules/azurerm_nsg"
  ch_nsgs = var.pr_nsgs
}

module "azurerm_network_interface" {
  source     = "../../modules/azurerm_nic"
  ch_nics    = var.pr_nics
  depends_on = [module.azurerm_subnets, module.azurerm_network_security_group]
}

module "azurerm_linux_vm" {
  source     = "../../modules/azurerm_linux_vm"
  ch_vms     = var.ch_vms
  depends_on = [module.azurerm_network_interface]
}

module "vm_association" {
  source     = "../../modules/vm_association"
  ch_nisg    = var.ch_nisg
  depends_on = [module.azurerm_network_interface, module.azurerm_network_security_group]
}

module "azurerm_bastion" {
  source      = "../../modules/azurerm_bastion"
  ch_bastions = var.ch_bastions
  depends_on  = [module.azurerm_subnets, module.azurerm_public_ip]
}

module "azurerm_sql_db" {
  source     = "../../modules/Azurerm_sql_db"
  ch_sql     = var.ch_sql
  depends_on = [module.azurerm_resource_group]
}
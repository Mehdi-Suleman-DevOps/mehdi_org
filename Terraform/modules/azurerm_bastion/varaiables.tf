  variable "ch_bastions" {
  type = map(object({
    bastion_name           = string
    resource_group_name    = string
    location               = string
    vnet_name              = string
    subnet_name            = string
    ip_configuration_name  = string
    pip_name               = string
  }))
}

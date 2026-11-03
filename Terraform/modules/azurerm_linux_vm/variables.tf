variable "ch_vms" {
  description = "A map of virtual machines to create"
  type        = map(object({
    vm_name              = string
    resource_group_name  = string
    location             = string
    vm_size              = string
    disable_password_authentication = bool
    image_publisher      = string
    image_offer          = string
    image_sku            = string
    image_version        = string
    nic_name             = string
  }))
  
}
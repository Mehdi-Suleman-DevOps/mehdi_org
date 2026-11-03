variable "ch_nisg" {
    type = map(object({
        resource_group_name = string
        nic_name = string
        nsg_name = string
    }))
}
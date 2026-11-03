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
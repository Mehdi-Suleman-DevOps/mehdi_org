# terraform {
#     required_version = ">= 1.5.0"
#   backend "azurerm" {
#     resource_group_name  = "infra_pipeline"
#     storage_account_name = "infraautopipeline"
#     container_name       = "infrapipeline"
#     key                  = "dev.terraform.tfstate"
#   }
# }
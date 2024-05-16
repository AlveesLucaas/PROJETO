terraform {
  backend "azurerm" {
    resource_group_name  = "RG-TERRAFORM"
    storage_account_name = "example-stg-acc"
    container_name       = "tfstate-files-prd"
    key                  = "terraform.devops-tools-tfstate-files"
  }
}
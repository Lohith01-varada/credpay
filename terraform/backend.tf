terraform {
  backend "azurerm" {
    storage_account_name = "credpaystatestg0112"
    container_name       = "credpaystatecont"
    resource_group_name  = "credpaystatrg"
    key                  = "terraform.tfstate"
  }
}
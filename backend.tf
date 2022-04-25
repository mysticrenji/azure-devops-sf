terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-k8s-kubeadm"
    storage_account_name = "mysticrenji"
    container_name       = "sfdevops"
    key                  = "terraform.tfstate"

  }
}
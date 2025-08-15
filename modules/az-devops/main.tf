resource "azuredevops_project" "project" {
  name               = var.project
  description        = var.project_description
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

data "azuredevops_projects" "project" {
  name  = var.project
  state = "wellFormed"
}

terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.1.0"
    }
  }
}


module "azure-devops" {
  source              = "./modules/az-devops"
  project             = var.project
  project_description = var.project_description
}

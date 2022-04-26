# module "azure-devops" {
#   source              = "./modules/az-devops"
#   project             = var.project
#   project_description = var.project_description
# }

module "service-fabric-managed" {
  source         = "./modules/service-fabric-managed"
  sf_name        = var.sf_name
  sf_rg_name     = var.sf_rg_name
  location       = var.location
  admin_username = var.admin_username
  admin_password = var.admin_password
}

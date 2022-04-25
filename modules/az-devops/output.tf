output "project_url" {
  value = data.azuredevops_projects.project.projects.*.project_url
}
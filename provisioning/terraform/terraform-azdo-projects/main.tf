resource "azuredevops_project" "CINSW IAC Demo" {
  name               = "CINSW IAC Demo"
  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Scrum"
  description        = "Managed by Terraform"
  features = {
    "artifacts"    = "enabled"
    "boards"       = "enabled"
    "pipelines"    = "enabled"
    "repositories" = "enabled"
    "testplans"    = "enabled"
  }
}
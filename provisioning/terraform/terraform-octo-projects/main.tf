resource "octopusdeploy_library_variable_set" "newvariableset" {
  description = var.description
  name        = var.variableSetName
}

resource "octopusdeploy_project" "SampleProject_1" {
  auto_create_release                  = false
  default_guided_failure_mode          = "EnvironmentDefault"
  default_to_skip_if_already_installed = false
  description                          = "Sample Octupus Deploy Development Project"
  discrete_channel_release             = false
  is_disabled                          = false
  is_discrete_channel_release          = false
  is_version_controlled                = false
  lifecycle_id                         = "Lifecycles-123"
  name                                 = "Sample Project 1"
  project_group_id                     = "ProjectGroups-Sample"
  tenanted_deployment_participation    = "TenantedOrUntenanted"

  connectivity_policy {
    allow_deployments_to_no_targets = false
    exclude_unhealthy_targets       = false
    skip_machine_behavior           = "SkipUnavailableMachines"
  }

  template {
    default_value = "example-default-value"
    help_text     = "example-help-test"
    label         = "example-label"
    name          = "example-template-value"
    display_settings = {
      "Octopus.ControlType" : "SingleLineText"
    }
  }
}
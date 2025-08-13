module "gitlab-profile" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name        = "gitlab-profile"
  description = "Dokumentacja techniczna dla obrazów kontenerowych"
  visibility  = "public"

  parent_group = local.parent_name
  project_type = "gitlab-profile"

  # sonarqube
  is_enabled_sonarqube = false
}

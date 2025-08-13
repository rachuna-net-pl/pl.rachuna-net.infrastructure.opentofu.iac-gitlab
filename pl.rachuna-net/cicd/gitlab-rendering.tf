
module "gitlab-rendering" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name           = "gitlab-rendering"
  description    = "Repozytorium pomocnicze renderujące pipeline"
  visibility     = "public"
  avatar         = "dev-tools"
  gitlab_ci_path = ".gitlab-ci.yml"

  parent_group = local.parent_name
  project_type = ""

  # sonarqube
  is_enabled_sonarqube = false

}
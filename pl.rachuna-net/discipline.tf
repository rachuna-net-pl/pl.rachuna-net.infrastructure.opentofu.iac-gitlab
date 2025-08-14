
module "discipline" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name           = "discipline"
  description    = "Zasady Dyscypliny"
  visibility     = "public"
  tags           = ["discipline", "gohugo"]
  avatar         = "docs"
  parent_group   = local.parent_name
  project_type   = ""
  gitlab_ci_path = "dependency-update.yml@pl.rachuna-net/cicd/gitlab-ci:renovate"

  # sonarqube
  is_enabled_sonarqube = false

  # mirror to github
  mirror_url = format(
    "https://%s:%s@github.com/%s/%s.git",
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_TOKEN"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    "${replace(local.parent_name, "/", ".")}.${module.discipline.name}"
  )
}

resource "github_repository" "pl-rachuna-net-discipline" {
  name        = "${replace(local.parent_name, "/", ".")}.${module.discipline.name}"
  description = module.discipline.description
  visibility  = "public"
}
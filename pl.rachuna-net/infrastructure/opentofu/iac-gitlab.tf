
module "iac-gitlab" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name        = "iac-gitlab"
  description = "IAC do zarządzania środowiskiem GitLab."
  visibility  = "public"
  avatar      = "opentofu"

  parent_group = local.parent_name
  project_type = "opentofu"

  # sonarqube
  is_enabled_sonarqube = false

  # mirror to github
  mirror_url = format(
    "https://%s:%s@github.com/%s/%s.git",
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_TOKEN"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    "${replace(local.parent_name, "/", ".")}.${module.iac-gitlab.name}"
  )
}

resource "github_repository" "pl-rachuna-net-infrastructure-opentofu-iac-gitlab" {
  name        = "${replace(local.parent_name, "/", ".")}.${module.iac-gitlab.name}"
  description = module.iac-gitlab.description
  visibility  = "public"
}
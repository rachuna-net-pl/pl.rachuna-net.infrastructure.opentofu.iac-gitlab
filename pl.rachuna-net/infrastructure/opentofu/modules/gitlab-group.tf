module "gitlab-group" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name        = "gitlab-group"
  description = "Zarządzanie grupą w GitLab"
  visibility  = "public"
  avatar      = "gitlab"

  parent_group = local.parent_name
  project_type = local.project_type

  # sonarqube
  is_enabled_sonarqube = false

  # mirror to github
  mirror_url = format(
    "https://%s:%s@github.com/%s/%s.git",
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_TOKEN"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    "${replace(local.parent_name, "/", ".")}.${module.gitlab-group.name}"
  )
}

resource "github_repository" "pl-rachuna-net-infrastructure-opentofu-modules-gitlab-group" {
  name        = "${replace(local.parent_name, "/", ".")}.${module.gitlab-group.name}"
  description = module.gitlab-group.description
  visibility  = "public"
}
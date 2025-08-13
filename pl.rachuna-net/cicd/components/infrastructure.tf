module "infrastructure" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name        = "infrastructure"
  description = "Komponentu odpowiedzialne za zarządzanie infrastrukturą."
  visibility  = "public"

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
    "${replace(local.parent_name, "/", ".")}.${module.infrastructure.name}"
  )
}

resource "github_repository" "pl-rachuna-net-cicd-components-infrastructure" {
  name        = "${replace(local.parent_name, "/", ".")}.${module.infrastructure.name}"
  description = module.infrastructure.description
  visibility  = "public"
}
module "trivy" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name        = "trivy"
  description = "Kontener z narzędziem trivy"
  visibility  = "public"
  avatar      = "trivy"

  parent_group = local.parent_name
  project_type = "container"

  # sonarqube
  is_enabled_sonarqube = false

  # mirror to github
  mirror_url = format(
    "https://%s:%s@github.com/%s/%s.git",
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_TOKEN"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    "${replace(local.parent_name, "/", ".")}.${module.trivy.name}"
  )
}

resource "github_repository" "pl-rachuna-net-containers-trivy" {
  name        = "${replace(local.parent_name, "/", ".")}.${module.trivy.name}"
  description = module.trivy.description
  visibility  = "public"
}
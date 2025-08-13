module "containers" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name        = "containers"
  description = "Komponentu odpowiedzialne za budowanie i publikacje kontenerów."
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
    "${replace(local.parent_name, "/", ".")}.${module.containers.name}"
  )
}

resource "github_repository" "pl-rachuna-net-cicd-components-containers" {
  name        = "${replace(local.parent_name, "/", ".")}.${module.containers.name}"
  description = module.containers.description
  visibility  = "public"
}
module "buildah" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name        = "buildah"
  description = "Kontener z narzędziem Buildah, wykorzystywany w procesach budowania kontenerów w środowisku GitLab CI."
  visibility  = "public"
  avatar      = "buildah"

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
    "${replace(local.parent_name, "/", ".")}.${module.buildah.name}"
  )
}

resource "github_repository" "pl-rachuna-net-containers-buildah" {
  name        = "${replace(local.parent_name, "/", ".")}.${module.buildah.name}"
  description = module.buildah.description
  visibility  = "public"
}
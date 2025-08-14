
module "docs" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name        = "docs"
  description = "Dokumentacja projektu pl.rachuna-net"
  visibility  = "public"
  avatar      = "gohugo"
  tags        = ["documentation", "gohugo"]

  parent_group = local.parent_name
  project_type = "docs"

  # sonarqube
  is_enabled_sonarqube = false

  # mirror to github
  mirror_url = format(
    "https://%s:%s@github.com/%s/%s.git",
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_TOKEN"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    "${replace(local.parent_name, "/", ".")}.${module.docs.name}"
  )
}

resource "github_repository" "pl-rachuna-net-docs" {
  name        = "${replace(local.parent_name, "/", ".")}.${module.docs.name}"
  description = module.docs.description
  visibility  = "public"
}
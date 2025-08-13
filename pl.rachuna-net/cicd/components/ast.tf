module "ast" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name        = "ast"
  description = "Komponent do analizy pod kątem bezpiecezństwa (Application Security Testing)."
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
    "${replace(local.parent_name, "/", ".")}.${module.ast.name}"
  )
}

resource "github_repository" "pl-rachuna-net-cicd-components-ast" {
  name        = "${replace(local.parent_name, "/", ".")}.${module.ast.name}"
  description = module.ast.description
  visibility  = "public"
}
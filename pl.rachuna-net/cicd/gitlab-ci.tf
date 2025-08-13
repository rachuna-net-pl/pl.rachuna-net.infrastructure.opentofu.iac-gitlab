module "gitlab-ci" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-project.git?ref=v1.0.0"

  name        = "gitlab-ci"
  description = "Procesy do ciągłej integracji i dostarczania (CI/CD) dla projektów w grupie pl.rachuna-net."
  visibility  = "public"

  parent_group = local.parent_name
  project_type = "gitlab-ci"

  # sonarqube
  is_enabled_sonarqube = false

  # mirror to github
  mirror_url = format(
    "https://%s:%s@github.com/%s/%s.git",
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_TOKEN"],
    data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"],
    "${replace(local.parent_name, "/", ".")}.${module.gitlab-ci.name}"
  )
}

resource "github_repository" "pl-rachuna-net-cicd-gitlab-ci" {
  name        = "${replace(local.parent_name, "/", ".")}.${module.gitlab-ci.name}"
  description = module.gitlab-ci.description
  visibility  = "public"
}

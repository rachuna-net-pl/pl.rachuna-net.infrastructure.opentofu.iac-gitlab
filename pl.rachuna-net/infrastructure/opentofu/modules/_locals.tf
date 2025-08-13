locals {
  parent_name  = "pl.rachuna-net/infrastructure/opentofu/modules"
  project_type = "opentofu-module"
}

data "vault_kv_secret_v2" "auth_github" {
  mount = "kv-gitlab"
  name  = "pl.rachuna-net/auth/github"
}
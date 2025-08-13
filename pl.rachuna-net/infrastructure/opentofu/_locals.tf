locals {
  parent_name = "pl.rachuna-net/infrastructure/opentofu"
  parent_ns   = "pl.rachuna-net.infrastructure.opentofu"
}

data "vault_kv_secret_v2" "auth_github" {
  mount = "kv-gitlab"
  name  = "pl.rachuna-net/auth/github"
}
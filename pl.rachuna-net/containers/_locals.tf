locals {
  parent_name  = "pl.rachuna-net/containers"
  project_type = "container"
}

data "vault_kv_secret_v2" "auth_github" {
  mount = "kv-gitlab"
  name  = "pl.rachuna-net/auth/github"
}
locals {
  parent_name = ""
}

data "vault_kv_secret_v2" "auth_gitlab" {
  mount = "kv-gitlab"
  name  = "pl.rachuna-net/auth/gitlab"
}

data "vault_kv_secret_v2" "auth_vault" {
  mount = "kv-gitlab"
  name  = "pl.rachuna-net/auth/vault"
}

data "vault_kv_secret_v2" "auth_sonarcloud" {
  mount = "kv-gitlab"
  name  = "pl.rachuna-net/auth/sonarcloud"
}
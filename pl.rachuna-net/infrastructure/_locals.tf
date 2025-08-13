locals {
  parent_name = "pl.rachuna-net/infrastructure"
}

data "vault_kv_secret_v2" "auth_github" {
  mount = "kv-gitlab"
  name  = "pl.rachuna-net/auth/github"
}

data "vault_kv_secret_v2" "gitlab_pl_rachuna_net-infrastructure-ansible" {
  mount = "kv-gitlab"
  name  = "pl.rachuna-net/infrastructure/ansible"
}

data "vault_kv_secret_v2" "auth_gitlab" {
  mount = "kv-gitlab"
  name  = "pl.rachuna-net/auth/gitlab"
}

data "vault_kv_secret_v2" "gitlab_pl_rachuna_net-infrastructure-packer" {
  mount = "kv-gitlab"
  name  = "pl.rachuna-net/infrastructure/packer"
}

terraform {
  required_version = ">= 1.10.5"
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "18.2.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "5.1.0"
    }
    github = {
      source  = "kuwas/github"
      version = "4.3.0"
    }
  }
  backend "http" {}
}

provider "gitlab" {
  token    = data.vault_kv_secret_v2.auth_gitlab.data["GITLAB_TOKEN"]
  base_url = data.vault_kv_secret_v2.auth_gitlab.data["GITLAB_URL"]
}

provider "vault" {
  address         = "https://vault.rachuna-net.pl"
  skip_tls_verify = true
}

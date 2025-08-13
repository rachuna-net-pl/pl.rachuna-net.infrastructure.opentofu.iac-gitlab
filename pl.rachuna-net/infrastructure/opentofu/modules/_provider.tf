terraform {
  required_providers {
    github = {
      source  = "kuwas/github"
      version = "4.3.0"
    }
  }
}

provider "github" {
  token = data.vault_kv_secret_v2.auth_github.data["GITHUB_TOKEN"]
  owner = data.vault_kv_secret_v2.auth_github.data["GITHUB_OWNER"]
}
module "_pl_rachuna-net" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-group.git?ref=v1.0.0"

  name           = "pl.rachuna-net"
  description    = "https://rachuna-net.pl"
  parent_group   = local.parent_name
  visibility     = "public"
  default_branch = "main"
  avatar         = "root"

  labels = jsondecode(file("${path.module}/data/labels.json"))
  badges = jsondecode(file("${path.module}/data/group_badges.json"))

  variables = {
    GITLAB_SSH_KEY = {
      description = "Klucz SSH dla gitlab runnera do komunikacji z gitlabem"
      value       = data.vault_kv_secret_v2.auth_gitlab.data["GITLAB_SSH_KEY"]
    }
    GITLAB_TOKEN = {
      description = "GitLab Token dla gitlab runnera"
      masked      = true
      value       = data.vault_kv_secret_v2.auth_gitlab.data["GITLAB_TOKEN"]
    }
    SONAR_TOKEN = {
      description = "SonarQube Token dla gitlab runnera"
      masked      = true
      value       = data.vault_kv_secret_v2.auth_sonarcloud.data["SONAR_TOKEN"]
    }
    VAULT_ADDR = {
      description = "Adres serwera Vault"
      value       = data.vault_kv_secret_v2.auth_vault.data["vault_address"]
    }
    VAULT_TOKEN = {
      description = "Vault token dla gitlab runnera do komunikacji z vaultem"
      masked      = true
      value       = data.vault_kv_secret_v2.auth_vault.data["token"]
    }
  }
}

module "pl_rachuna-net" {
  source = "./pl.rachuna-net/"
}
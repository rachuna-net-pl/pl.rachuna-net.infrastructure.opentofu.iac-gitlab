module "_opentofu" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-group.git?ref=v1.0.0"

  name         = "opentofu"
  description  = "Repozytoria i moduły do zarządzania infrastrukturą jako kodem (IaC) za pomocą opentofu"
  parent_group = local.parent_name
  visibility   = "public"
  avatar       = "opentofu"
}

module "opentofu" {
  source = "./opentofu/"
}
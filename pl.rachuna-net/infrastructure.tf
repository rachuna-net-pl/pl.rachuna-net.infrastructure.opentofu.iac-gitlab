module "_infrastructure" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-group.git?ref=v1.0.0"

  name         = "infrastructure"
  description  = "Repozytoria i moduły do zarządzania infrastrukturą jako kodem (IaC)."
  parent_group = local.parent_name
  visibility   = "public"
  avatar       = "infrastructure"
}

module "infrastructure" {
  source = "./infrastructure/"
}
module "_tools" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-group.git?ref=v1.0.0"

  name           = "tools"
  description    = "Narzedzia i skrypty do automatyzacji zadań administracyjnych i zarządzania infrastrukturą."
  parent_group   = local.parent_name
  visibility     = "public"
  default_branch = "main"
  avatar         = "dev-tools"
}

module "tools" {
  source = "./tools/"
}
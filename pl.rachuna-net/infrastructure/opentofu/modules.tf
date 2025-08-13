module "_modules" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-group.git?ref=v1.0.0"

  name         = "modules"
  description  = "Zbiór modułów Opentofu do zarządzania infrastrukturą."
  parent_group = local.parent_name
  visibility   = "public"
  avatar       = "opentofu"
}

module "modules" {
  source = "./modules/"
}
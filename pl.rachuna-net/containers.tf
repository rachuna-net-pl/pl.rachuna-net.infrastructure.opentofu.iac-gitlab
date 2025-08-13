module "_containers" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-group.git?ref=v1.0.0"

  name           = "containers"
  description    = "Repozytoria z obrazami kontenerowymi."
  parent_group   = local.parent_name
  visibility     = "public"
  default_branch = "main"
  avatar         = "containers"

}

module "containers" {
  source = "./containers/"
}
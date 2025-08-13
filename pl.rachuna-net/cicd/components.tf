module "_components" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-group.git?ref=v1.0.0"

  name         = "components"
  description  = "Wspólne komponenty wykorzystywane w procesach CI/CD."
  parent_group = local.parent_name
  visibility   = "public"
  avatar       = "gitlab"
}

module "components" {
  source = "./components/"
}
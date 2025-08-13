module "_cicd" {
  source = "git@gitlab.com:pl.rachuna-net/infrastructure/opentofu/modules/gitlab-group.git?ref=v1.0.0"

  name           = "cicd"
  description    = "Centralne komponenty i procesy dla GitLab CI/CD."
  parent_group   = local.parent_name
  visibility     = "public"
  default_branch = "main"
  avatar         = "gitlab"

}

module "cicd" {
  source = "./cicd/"
}
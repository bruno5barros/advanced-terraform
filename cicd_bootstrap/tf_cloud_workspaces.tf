resource "tfe_oauth_client" "oauth" {
  organization     = var.tf_cloud_organization
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_oauth_token
  service_provider = "github"
}

resource "tfe_workspace" "dev" {
  name                  = "app_dev"
  organization          = var.tf_cloud_organization
  tag_names             = ["app", "dev_environment"]
  allow_destroy_plan    = true
  auto_apply            = true
  queue_all_runs        = false
  file_triggers_enabled = false
  vcs_repo {
    identifier     = var.vcs_identifier
    branch         = var.dev_main_branch
    oauth_token_id = tfe_oauth_client.oauth.oauth_token_id
  }
}

resource "tfe_workspace" "qa" {
  name                  = "app_qa"
  organization          = var.tf_cloud_organization
  tag_names             = ["app", "qa_environment"]
  allow_destroy_plan    = true
  auto_apply            = true
  queue_all_runs        = false
  file_triggers_enabled = false
  vcs_repo {
    identifier     = var.vcs_identifier
    branch         = var.qa_main_branch
    oauth_token_id = tfe_oauth_client.oauth.oauth_token_id
  }
}
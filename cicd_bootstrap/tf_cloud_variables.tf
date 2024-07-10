resource "tfe_variable" "dev_project_id" {
  key          = "project-id"
  value        = var.dev_project_id
  category     = "terraform"
  workspace_id = tfe_workspace.dev.id
  description  = "Dev GCP project id."
}

resource "tfe_variable" "qa_project_id" {
  key          = "project-id"
  value        = var.qa_project_id
  category     = "terraform"
  workspace_id = tfe_workspace.qa.id
  description  = "Qa GCP project id."
}

resource "tfe_variable" "dev_target_environment" {
  key          = "target_environment"
  value        = "DEV"
  category     = "terraform"
  workspace_id = tfe_workspace.dev.id
  description  = "Dev tatget environment."
}

resource "tfe_variable" "qa_target_environment" {
  key          = "target_environment"
  value        = "QA"
  category     = "terraform"
  workspace_id = tfe_workspace.qa.id
  description  = "QA target environment."
}

resource "tfe_variable" "dev_google_credentials" {
  key          = "GOOGLE_CREDENTIALS"
  value        = replace(module.dev_service_account.key, "/\\n/","")
  category     = "env"
  workspace_id = tfe_workspace.dev.id
  sensitive    = true
  description  = "DEV project credentials."
}

resource "tfe_variable" "qa_google_credentials" {
  key          = "GOOGLE_CREDENTIALS"
  value        = replace(module.qa_service_account.key, "/\\n/","")
  category     = "env"
  workspace_id = tfe_workspace.qa.id
  sensitive    = true
  description  = "QA project credentials."
}
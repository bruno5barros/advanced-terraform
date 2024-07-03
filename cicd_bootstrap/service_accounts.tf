module "dev_service_account" {
  source = "terraform-google-modules/service-accounts/google"
  project_id = var.dev_project_id
  names = ["terraform-cloud"]
  generate_keys = true
  project_roles = [
    "${var.dev_project_id}=>roles/owner"
  ]
}

module "qa_service_account" {
  source = "terraform-google-modules/service-accounts/google"
  project_id = var.qa_project_id
  names = ["terraform-cloud"]
  generate_keys = true
  project_roles = [
    "${var.qa_project_id}=>roles/owner"
  ]
}
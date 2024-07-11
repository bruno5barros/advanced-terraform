module "service_accounts" {
  source             = "terraform-google-modules/service-accounts/google"
  project_id         = var.google_provider.project_id
  prefix             = "viewer-sa"
  names              = var.environment_list
  project_roles      = [
    "${var.google_provider.project_id}=>roles/viewer",
    "${var.google_provider.project_id}=>roles/storage.objectViewer"
  ]
  grant_billing_role = true
  org_id             = var.org_id
}
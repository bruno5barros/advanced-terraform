resource "google_project_service" "dev_services" {
  for_each           = toset(var.enable_services)
  project            = var.dev_project_id
  service            = each.key
  disable_on_destroy = false
}

resource "google_project_service" "qa_services" {
  for_each           = toset(var.enable_services)
  project            = var.qa_project_id
  service            = each.key
  disable_on_destroy = false
}
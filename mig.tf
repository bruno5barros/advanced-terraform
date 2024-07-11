module "vm_instance_template" {
  source          = "terraform-google-modules/vm/google//modules/instance_template"
  version         = "11.1.0"
  project_id      = var.google_provider.project_id
  subnetwork      = google_compute_subnetwork.subnet-1.self_link
  machine_type    = "e2-micro"
  service_account = {
    email         = ""
    scopes        = []
  }
}

module "vm_mig" {
  source            = "terraform-google-modules/vm/google//modules/mig"
  version           = "11.1.0"
  project_id        = var.google_provider.project_id
  region            = var.google_provider.region
  hostname          = "web-server"
  instance_template = module.vm_instance_template.self_link
}
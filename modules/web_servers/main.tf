provider "google" {
  project = var.google_provider.project_id
  region  = var.google_provider.region
  zone    = var.google_provider.zone
}

locals {
  prefix = var.prefix != "" ? "${var.prefix}-" : ""
}

resource "google_compute_instance" "web_instance" {
  for_each     = var.service_settings
  project      = var.google_provider.project_id
  name         = "${local.prefix}${lower(each.key)}"
  machine_type = each.value.machine_type
  labels       = each.value.labels

  boot_disk {
    initialize_params {
        image  = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = var.network_interface.network
    subnetwork = var.network_interface.subnetwork
  }
}
provider "google" {
  project = var.google_provider.project
  region  = var.google_provider.region
  zone    = var.google_provider.zone
}

resource "google_storage_bucket" "enviroment_buckets" {
  name     = "remote_state_${var.google_provider.project}"
  location = "US"
  versioning {
    enabled = true
  }
}
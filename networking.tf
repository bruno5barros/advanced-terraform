### NETWORK
data "google_compute_network" "default" {
  name                    = "default"
}

## SUBNET
resource "google_compute_subnetwork" "subnet-1" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_cidr
  network                  = data.google_compute_network.default.self_link
  region                   = var.google_provider.region
  private_ip_google_access = true
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = data.google_compute_network.default.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.firewall_ports
  }

  source_tags = var.compute_source_tags
}
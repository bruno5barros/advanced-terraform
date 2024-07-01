output "subnet_gateway" {
    value = google_compute_subnetwork.subnet-1.gateway_address
}

output "nginx_public_ip" {
    value = google_compute_instance.nginx_instance.network_interface[0].access_config[0].nat_ip
}
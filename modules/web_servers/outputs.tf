output "web_server_ips" {
    value = [for instance in google_compute_instance.web_instance : instance.network_interface[0].network_ip]
}
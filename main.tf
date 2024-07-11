### PROVIDER
provider "google" {
  project = "advancedterraform-427911" #replace this with your project-id
  region  = "us-central1"
  zone    = "us-central1-a"
}

# ### COMPUTE
# ## NGINX PROXY
# resource "google_compute_instance" "nginx_instance" {
#   name         = "nginx-proxy"
#   machine_type = var.environment_machine_type[var.target_enviroment]
#   labels       = {environment = var.environment_map[var.target_enviroment]}
#   tags         = var.compute_source_tags
  
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#     }
#   }

#   network_interface {
#     network = data.google_compute_network.default.self_link
#     subnetwork = google_compute_subnetwork.subnet-1.self_link
#     access_config {
      
#     }
#   }
# }

# ## Web servers
# module "web_servers" {
#   source            = "./modules/web_servers"
#   google_provider   = var.google_provider
#   service_settings  = var.environment_machine_settings
#   network_interface = {
#     network         = data.google_compute_network.default.self_link
#     subnetwork      = google_compute_subnetwork.subnet-1.self_link
#   }
# }

# ## DB
# resource "google_compute_instance" "mysqldb" {
#   name         = "mysqldb"
#   machine_type = "f1-micro"
  
#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#     }
#   }

#   network_interface {
#     network = data.google_compute_network.default.self_link
#     subnetwork = google_compute_subnetwork.subnet-1.self_link
#   }  
# }
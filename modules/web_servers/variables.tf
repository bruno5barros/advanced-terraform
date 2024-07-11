variable "google_provider" {
  description = "GCP attributes."

  type = object({
    project_id = string
    region     = string
    zone       = string
  })
}

variable "service_settings" {
  type = map(object({machine_type=string, labels=map(string)}))
}

variable "prefix" {
  type    = string
  default = "web"
}

variable "network_interface" {
  type = object({
    network=string
    subnetwork=string
  })
}
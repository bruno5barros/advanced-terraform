variable "google_provider" {
  description = "All the attributed related to the google provider."

  type = object({
    project = string
    region = string
    zone = string
  })  
  default = {
    project = "advancedterraform-427911"
    region  = "us-central1"
    zone    = "us-central1-a"
  }
}
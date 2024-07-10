variable "google_provider" {
  description = "GCP atributes."

  type = object({
      project_id = string
      region     = string
      zone       = string
  })

  default = {
      project_id = "advancedterraform-427911"
      region     = "us-central1"
      zone       = "us-central1-a"
  }
}

variable "org_id" {
  description = "GCP organizationn id."
  type        = string
  default     = ""
  sensitive   = true
}

variable "subnet_name" {
  description = "Name of the GCP sub net."
  type        = string
  default     = "subnet1"
}

variable "subnet-cidr" {
  description = "Ip cidr block."
  type        = string
  default     = "10.127.0.0/20"
}

variable "private_google_access" {
  type    = string
  default = true
}

variable "firewall_ports" {
  description = "All the ports that are accessable."
  type        = list
  default     = ["80", "8080", "1000-2000", "22"]
}

variable "compute_source_tags" {
  type    = list
  default = ["web"]
}

variable "target_enviroment" {
  type    = string
  default = "DEV"
}

variable "environment_list" {
  description = "List of all possible environments."
  type        = list
  default     = ["DEV", "QA", "STAGE", "PROD"]
}

variable "environment_map" {
  type = map(string)
  default = {
    "DEV"   = "dev"
    "QA"    = "qa"
    "STAGE" = "stage"
    "PROD"  = "prod"
  }
}

variable "environment_machine_type" {
  description = "Map the machine type to the environment."
  type        = map(string)
  default     = {
    "DEV"   = "f1-micro"
    "QA"    = "e2-micro"
    "STAGE" = "e2-micro"
    "PROD"  = "e2-medium"
  }
}

variable "environment_machine_settings" {
  description = "Create seetings for all environments."
  type        = map(object({machine_type=string, labels=map(string)}))
  default     = {
    "DEV" = {
      machine_type = "f1-micro"
      labels       = {
        "environment" = "dev"
      }
    }
    "QA" = {
      machine_type = "e2-micro"
      labels       = {
        "environment" = "qa"
      }
    }
    "STAGE" = {
      machine_type = "e2-micro"
      labels       = {
        "environment" = "stage"
      }
    }
    "PROD" = {
      machine_type = "e2-medium"
      labels       = {
        "environment" = "prod"
      }
    }
  }
}
variable "tf_cloud_token" {
  description = ""
  type = string
}

variable "tf_cloud_organization" {
  description = ""
  type = string
}

variable "tf_cloud_project_id" {
  description = ""
  type = string
}

variable "github_oauth_token" {
  description = ""
  type = string
}

variable "dev_project_id" {
  description = ""
  type = string
}

variable "qa_project_id" {
  description = ""
  type = string
}

variable "vcs_identifier" {
  description = ""
  type = string
}

variable "enable_services" {
  description = ""
  type = list
  default = ["iam.googleapis.com", "cloudresourcemanager.googleapis.com", "compute.googleapis.com", "redis.googleapis.com"]
}

variable "dev_main_branch" {
  description = ""
  type = string
  default = "04_06_dev"
}

variable "qa_main_branch" {
    description = ""
    type = string
    default = "04_06_qa"
}
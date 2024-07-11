# resource "google_storage_bucket" "environment_buckets" {
#   for_each   = toset(var.environment_list)
#   name       = "${lower(each.key)}_${var.google_provider.project_id}"
#   location   = "US"
#   versioning {
#     enabled  = true
#   }
# }
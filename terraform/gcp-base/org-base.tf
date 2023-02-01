resource "google_project_service" "org_base_apis" {
  for_each = { for k in toset(local.org_base_apis) : k => k }
  project  = data.google_project.org_base.project_id
  service  = each.value
}

resource "google_storage_bucket" "org-tf-bucket" {
  project       = data.google_project.org_base.project_id
  name          = local.org_bucket_name
  location      = local.region
  force_destroy = true
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

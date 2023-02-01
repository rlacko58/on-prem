resource "google_project" "on-prem" {
  name       = "on-prem"
  project_id = "on-prem-778"
  org_id     = local.org_id

  billing_account = data.google_billing_account.default_billing_account.id
}

resource "google_service_account" "on-prem-sa" {
  account_id   = "on-prem-sa"
  display_name = "Onprem SA"
  project      = google_project.on-prem.project_id
}

resource "google_project_iam_member" "on-prem-sa-iam-on-project" {
  for_each = { for k in toset(local.sa_roles_on_project) : k => k }
  project  = google_project.on-prem.id
  role     = each.value
  member   = "serviceAccount:${google_service_account.on-prem-sa.email}"
}

resource "google_storage_bucket" "on-prem-tf-bucket" {
  project       = google_project.on-prem.project_id
  name          = local.on_prem_bucket_name
  location      = local.region
  force_destroy = true
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}

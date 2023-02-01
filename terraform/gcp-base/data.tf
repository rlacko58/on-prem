locals {
  org_id         = "319675273017"
  org_project_id = "org-base"
  org_base_apis = [
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "storage.googleapis.com",
    "cloudbilling.googleapis.com",
    "secretmanager.googleapis.com"
  ]
  org_bucket_name   = "terraform-state-org-base"
  region            = "europe-west3"
  repo              = "rlacko58/on-prem"
  org_sa_account_id = "org-admin@org-base.iam.gserviceaccount.com"
  billing_account   = "016D03-F7685F-D7EFA5"
}

data "google_project" "org_base" {
  project_id = local.org_project_id
}

data "google_service_account" "org_sa" {
  account_id = local.org_sa_account_id
}

data "google_billing_account" "default_billing_account" {
  billing_account = "016D03-F7685F-D7EFA5"
}

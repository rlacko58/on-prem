terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
  backend "gcs" {
    bucket = "terraform-state-org-base"
    prefix = "root/org-base"
  }
}

provider "google" {
  project                     = "org-base"
  region                      = "europe-west3"
  impersonate_service_account = "org-admin@org-base.iam.gserviceaccount.com"
}

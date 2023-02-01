output "workload_identity_provider" {
  value = "${google_iam_workload_identity_pool.github_pool.name}/providers/${google_iam_workload_identity_pool_provider.github.workload_identity_pool_provider_id}"
}

output "service_account_org" {
  value = data.google_service_account.org_sa.email
}

output "org-terraform-bucket" {
  value = google_storage_bucket.org-tf-bucket.name
}

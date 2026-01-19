terraform {
  backend "gcs" {
    bucket = "gcp-infra-builder"
    prefix = "non-prod/gcp"
  }
}

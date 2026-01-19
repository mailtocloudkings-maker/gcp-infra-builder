terraform {
  backend "gcs" {
    bucket  = "tf-state-non-prod"
    prefix  = "gcp"
  }
}

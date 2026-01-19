terraform {
  backend "gcs" {
    bucket  = var.tf_state_bucket
    prefix  = var.tf_state_prefix
  }
}

terraform {
  required_version = ">= 1.3"
  
  backend "gcs" {
    bucket = var.tf_state_bucket
    prefix = var.tf_state_prefix
  }
}

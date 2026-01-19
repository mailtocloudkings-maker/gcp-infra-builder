resource "google_storage_bucket" "bucket" {
  name     = "${var.name_prefix}-bucket-${var.suffix}"
  location = "US"
}

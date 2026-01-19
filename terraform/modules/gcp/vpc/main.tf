resource "google_compute_network" "this" {
  name                    = "${var.name_prefix}-vpc-${var.suffix}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  name          = "${var.name_prefix}-subnet-${var.suffix}"
  network       = google_compute_network.this.id
  region        = "us-central1"
  ip_cidr_range = "10.10.0.0/16"
}

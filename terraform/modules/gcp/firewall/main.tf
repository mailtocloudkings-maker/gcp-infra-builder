# Data source to use default VPC
data "google_compute_network" "default_vpc" {
  name = "default"
}

# Firewall for VMs in default VPC
resource "google_compute_firewall" "allow_internal" {
  name        = "${var.name_prefix}-fw-${var.suffix}"
  network     = data.google_compute_network.default_vpc.id
  target_tags = ["vm"]

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "5432", "9090", "3001"] # SSH, HTTP, HTTPS, Postgres, Prometheus, BindPlane UI
  }

  source_ranges = ["0.0.0.0/0"] # Open to all; adjust if you want internal-only
}

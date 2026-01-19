# General internal firewall
resource "google_compute_firewall" "allow_internal" {
  name    = "${var.name_prefix}-fw-${var.suffix}"
  network = var.network_id

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  source_ranges = ["10.0.0.0/8"]
}

# BindPlane agent firewall (allow 0.0.0.0/0 for agent connectivity)
resource "google_compute_firewall" "bindplane_agent" {
  name        = "${var.name_prefix}-bindplane-agent-${var.suffix}"
  network     = var.network_id
  target_tags = ["bindplane"]

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# BindPlane UI firewall (allow traffic to UI port)
resource "google_compute_firewall" "bindplane_ui" {
  name    = "${var.name_prefix}-bindplane-ui-${var.suffix}"
  network = var.network_id

  allow {
    protocol = "tcp"
    ports    = ["3001"]
  }

  source_ranges = ["0.0.0.0/0"]
}

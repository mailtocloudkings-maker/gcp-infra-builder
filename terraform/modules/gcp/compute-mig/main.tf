resource "google_compute_instance_template" "tmpl" {
  name_prefix  = "${var.name_prefix}-tmpl-${var.suffix}"
  machine_type = "e2-medium"

  disk {
    boot         = true
    auto_delete  = true
    source_image = "debian-cloud/debian-12"
  }

  network_interface {
    subnetwork = var.subnet_id
  }
}

resource "google_compute_instance_group_manager" "mig" {
  name               = "${var.name_prefix}-mig-${var.suffix}"
  base_instance_name = "app"
  zone               = "us-central1-a"
  target_size        = 2

  version {
    instance_template = google_compute_instance_template.tmpl.id
  }
}

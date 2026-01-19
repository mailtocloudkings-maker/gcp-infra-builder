resource "google_compute_instance" "vm" {
  name         = "${var.name_prefix}-vm-${var.suffix}"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.boot_image
    }
  }

  network_interface {
    subnetwork = var.subnet_id
    # You can optionally assign external IP:
    access_config {}
  }

  tags = var.tags

  # Optional: metadata for startup scripts, etc.
  metadata = {
    startup-script = ""
  }
}

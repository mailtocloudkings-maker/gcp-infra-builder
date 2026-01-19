resource "google_compute_instance" "vm" {
  name         = "${var.name_prefix}-vm-${var.suffix}"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = var.subnet_id
  }

  tags = ["vm"]
}

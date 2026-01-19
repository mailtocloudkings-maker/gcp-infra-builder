resource "google_compute_instance" "vm" {
  name         = "${var.name_prefix}-${var.suffix}"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork = var.subnet_id
    # optionally connect to CloudSQL private IP
    network_ip = var.cloudsql_private_ip != "" ? var.cloudsql_private_ip : null
  }

  tags = var.tags
}

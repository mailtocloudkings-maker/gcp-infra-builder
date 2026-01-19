resource "google_compute_instance" "vm" {
  count        = var.create_vm ? 1 : 0
  name         = "${var.name_prefix}-vm-${var.suffix}"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork = var.subnet_id
    access_config {}
  }

  metadata = {
    cloudsql_private_ip = var.cloudsql_private_ip
    cloudsql_user       = var.cloudsql_user
    cloudsql_db_name    = var.cloudsql_db_name
  }

  tags = var.tags
}

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
    access_config {}
  }

  tags = var.tags

  metadata = {
    startup-script = <<-EOT
      #!/bin/bash
      echo "VM startup"

      CLOUDSQL_IP="${var.cloudsql_private_ip}"
      DB_USER="${var.cloudsql_user}"
      DB_NAME="${var.cloudsql_db_name}"
      DB_PASS="${var.cloudsql_password}"

      if [ -n "$CLOUDSQL_IP" ]; then
        echo "$CLOUDSQL_IP:5432:$DB_NAME:$DB_USER:$DB_PASS" > /root/.pgpass
        chmod 600 /root/.pgpass
      fi
    EOT
  }
}

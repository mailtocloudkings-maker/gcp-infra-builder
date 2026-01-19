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
    # Optional external IP
    access_config {}
  }

  tags = var.tags

  # Metadata for startup scripts
  metadata = {
    startup-script = <<-EOT
      #!/bin/bash
      echo "Starting VM initialization..."

      # Optional: configure CloudSQL connection if IP is provided
      CLOUDSQL_IP="${var.cloudsql_private_ip}"
      DB_USER="${var.cloudsql_user}"
      DB_NAME="${var.cloudsql_db_name}"
      DB_PASS="${var.cloudsql_password}"

      if [ ! -z "$CLOUDSQL_IP" ]; then
        echo "Configuring CloudSQL connection..."
        # Ensure home directory exists
        mkdir -p /home/${var.name_prefix}
        # Example: create a .pgpass file for postgres
        echo "$CLOUDSQL_IP:5432:$DB_NAME:$DB_USER:$DB_PASS" > /home/${var.name_prefix}/.pgpass
        chmod 600 /home/${var.name_prefix}/.pgpass
        chown ${var.name_prefix}:${var.name_prefix} /home/${var.name_prefix}/.pgpass
        echo "CloudSQL connection configured."
      fi

      echo "VM initialization complete."
    EOT
  }

  # Only depend on CloudSQL module if it exists
  depends_on = var.cloudsql_private_ip != "" ? [module.cloudsql] : []
}

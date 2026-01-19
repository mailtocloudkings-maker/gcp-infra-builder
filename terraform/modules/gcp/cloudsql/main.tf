# Data source for default VPC
data "google_compute_network" "default_vpc" {
  name = "default"
}

# Generate unique CloudSQL instance name
locals {
  instance_name = "${var.name_prefix}-pgsql-${var.suffix}"
}

# CloudSQL instance
resource "google_sql_database_instance" "postgres" {
  name             = local.instance_name
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = var.tier

    ip_configuration {
      # Attach to default VPC for private IP
      private_network = data.google_compute_network.default_vpc.id
    }

    # Optional: enable automated backups
    backup_configuration {
      enabled = var.enable_backups
    }
  }

  deletion_protection = var.deletion_protection
}

# Optional: Create a default database
resource "google_sql_database" "default_db" {
  count    = var.create_default_db ? 1 : 0
  name     = var.default_db_name
  instance = google_sql_database_instance.postgres.name
  charset  = "UTF8"
  collation = "en_US.UTF8"
}

# Optional: Create a user
resource "google_sql_user" "default_user" {
  count    = var.create_default_user ? 1 : 0
  name     = var.default_user_name
  instance = google_sql_database_instance.postgres.name
  password = var.default_user_password
}

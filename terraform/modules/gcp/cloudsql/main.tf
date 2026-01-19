# -----------------------------
# Local instance name
# -----------------------------
locals {
  instance_name = "${var.name_prefix}-pgsql-${var.suffix}"
}

# -----------------------------
# CloudSQL PostgreSQL Instance
# -----------------------------
resource "google_sql_database_instance" "postgres" {
  name             = local.instance_name
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network_id
    }

    backup_configuration {
      enabled = var.enable_backups
    }
  }

  deletion_protection = var.deletion_protection
}

# -----------------------------
# Optional: Default Database
# -----------------------------
resource "google_sql_database" "default_db" {
  count    = var.create_default_db ? 1 : 0
  name     = var.default_db_name
  instance = google_sql_database_instance.postgres.name
}

# -----------------------------
# Optional: Default User
# -----------------------------
resource "google_sql_user" "default_user" {
  count    = var.create_default_user ? 1 : 0
  name     = var.default_user_name
  instance = google_sql_database_instance.postgres.name
  password = var.default_user_password
}

# -----------------------------
# Outputs
# -----------------------------
output "private_ip" {
  value       = google_sql_database_instance.postgres.private_ip_address
  description = "Private IP of the CloudSQL instance"
}

output "default_db_name" {
  value       = var.create_default_db ? google_sql_database.default_db[0].name : ""
  description = "Name of the default database (if created)"
}

output "default_user_name" {
  value       = var.create_default_user ? google_sql_user.default_user[0].name : ""
  description = "Default DB user (if created)"
}

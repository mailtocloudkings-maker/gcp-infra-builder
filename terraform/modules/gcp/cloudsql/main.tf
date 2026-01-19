data "google_compute_network" "default_vpc" {
  name = "default"
}

locals {
  instance_name = "${var.name_prefix}-pgsql-${var.suffix}"
}

resource "google_sql_database_instance" "postgres" {
  name             = local.instance_name
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = var.tier

    ip_configuration {
      private_network = var.network_id != "" ? var.network_id : data.google_compute_network.default_vpc.id
      ipv4_enabled    = false
    }

    backup_configuration {
      enabled = var.enable_backups
    }
  }

  deletion_protection = var.deletion_protection
}

resource "google_sql_database" "default_db" {
  count    = var.create_default_db ? 1 : 0
  name     = var.default_db_name
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "default_user" {
  count    = var.create_default_user ? 1 : 0
  name     = var.default_user_name
  instance = google_sql_database_instance.postgres.name
  password = var.default_user_password
}

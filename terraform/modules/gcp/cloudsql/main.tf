resource "google_sql_database_instance" "postgres" {
  name             = "${var.name_prefix}-pgsql-${var.suffix}"
  database_version = "POSTGRES_14"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      private_network = var.network_id
    }
  }
}

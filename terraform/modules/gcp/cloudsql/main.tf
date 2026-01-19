# Data source for default VPC
data "google_compute_network" "default_vpc" {
  name = "default"
}

# CloudSQL instance
resource "google_sql_database_instance" "postgres" {
  name             = "${var.name_prefix}-pgsql-${var.suffix}"
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = var.tier
    ip_configuration {
      # Attach to default VPC for private IP
      private_network = data.google_compute_network.default_vpc.id
    }
  }
}

# Optional: Create a default database
resource "google_sql_database" "default_db" {
  name     = "appdb"
  instance = google_sql_database_instance.postgres.name
  charset  = "UTF8"
  collation = "en_US.UTF8"
}

# Optional: Create a user
resource "google_sql_user" "default_user" {
  name     = "appuser"
  instance = google_sql_database_instance.postgres.name
  password = "P@ssword123"  # Replace with secret management in prod
}

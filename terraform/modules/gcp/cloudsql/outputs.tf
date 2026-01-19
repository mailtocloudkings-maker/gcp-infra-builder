# CloudSQL instance name
output "instance_name" {
  value       = google_sql_database_instance.postgres.name
  description = "CloudSQL instance name"
}

# CloudSQL instance connection string
output "instance_connection_name" {
  value       = google_sql_database_instance.postgres.connection_name
  description = "CloudSQL instance connection string"
}

# CloudSQL private IP (optional)
output "private_ip" {
  value       = try(google_sql_database_instance.postgres.private_ip_address, "")
  description = "Private IP of the CloudSQL instance (empty if not configured)"
}

# Default database name (if created)
output "default_db_name" {
  value       = var.create_default_db && length(google_sql_database.default_db) > 0 ? google_sql_database.default_db[0].name : ""
  description = "Name of the default database (if created)"
}

# Default database user (if created)
output "default_user_name" {
  value       = var.create_default_user && length(google_sql_user.default_user) > 0 ? google_sql_user.default_user[0].name : ""
  description = "Default DB user (if created)"
}

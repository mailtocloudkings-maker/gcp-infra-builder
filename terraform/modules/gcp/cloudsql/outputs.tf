output "instance_name" {
  value       = google_sql_database_instance.postgres.name
  description = "CloudSQL instance name"
}

output "instance_connection_name" {
  value       = google_sql_database_instance.postgres.connection_name
  description = "CloudSQL instance connection string"
}

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

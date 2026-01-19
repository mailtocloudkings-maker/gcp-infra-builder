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
  value       = google_sql_database.default_db[*].name
  description = "Name of the default database"
}

output "default_user_name" {
  value       = google_sql_user.default_user[*].name
  description = "Default DB user"
}

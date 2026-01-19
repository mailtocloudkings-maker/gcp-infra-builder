output "instance_name" {
  value       = google_sql_database_instance.postgres.name
  description = "Name of the CloudSQL instance"
}

output "private_ip_address" {
  value       = google_sql_database_instance.postgres.private_ip_address
  description = "Private IP of CloudSQL instance"
}

output "db_name" {
  value       = google_sql_database.default_db.name
  description = "Default database name"
}

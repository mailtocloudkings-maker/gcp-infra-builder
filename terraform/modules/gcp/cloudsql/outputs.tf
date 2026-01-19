output "private_ip" {
  value = google_sql_database_instance.postgres.private_ip_address
}

output "default_db_name" {
  value = var.default_db_name
}

output "default_user_name" {
  value = var.default_user_name
}

output "instance_name" {
  value = google_sql_database_instance.postgres.name
}

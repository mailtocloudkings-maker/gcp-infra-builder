output "instance_name" {
  value = google_sql_database_instance.postgres.name
}

output "instance_connection_name" {
  value = google_sql_database_instance.postgres.connection_name
}

output "private_ip" {
  value = google_sql_database_instance.postgres.private_ip_address
}

output "default_db_name" {
  value = var.create_default_db ? google_sql_database.default_db[0].name : ""
}

output "default_user_name" {
  value = var.create_default_user ? google_sql_user.default_user[0].name : ""
}

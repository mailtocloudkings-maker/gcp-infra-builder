output "private_ip" {
  value = google_sql_database_instance.postgres.private_ip_address
}

output "default_db_name" {
  value = length(google_sql_database.default_db) > 0 ? google_sql_database.default_db[0].name : ""
}

output "default_user_name" {
  value = length(google_sql_user.default_user) > 0 ? google_sql_user.default_user[0].name : ""
}

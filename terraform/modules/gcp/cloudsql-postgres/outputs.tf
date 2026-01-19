output "private_ip" {
  value = google_sql_database_instance.this.private_ip_address
}

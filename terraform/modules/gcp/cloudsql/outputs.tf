# ==============================
# CloudSQL Outputs (conditional)
# ==============================

output "cloudsql_instance_name" {
  description = "CloudSQL instance name"
  value       = var.create_cloudsql && length(module.cloudsql) > 0 ? module.cloudsql[0].instance_name : ""
}

output "cloudsql_connection_name" {
  description = "CloudSQL instance connection string"
  value       = var.create_cloudsql && length(module.cloudsql) > 0 ? module.cloudsql[0].instance_connection_name : ""
}

output "cloudsql_private_ip" {
  description = "CloudSQL private IP"
  value       = var.create_cloudsql && length(module.cloudsql) > 0 ? module.cloudsql[0].private_ip : ""
}

output "cloudsql_db_name" {
  description = "Default database name in CloudSQL"
  value       = var.create_cloudsql && length(module.cloudsql) > 0 ? module.cloudsql[0].default_db_name : ""
}

output "cloudsql_user" {
  description = "Default CloudSQL username"
  value       = var.create_cloudsql && length(module.cloudsql) > 0 ? module.cloudsql[0].default_user_name : ""
}

# -----------------------------
# Outputs for pipeline / BindPlane
# -----------------------------
output "vm_name" {
  value       = module.compute_vm[0].vm_name
  description = "First VM name"
}

output "cloudsql_private_ip" {
  value       = module.cloudsql[0].private_ip
  description = "CloudSQL private IP"
}

output "cloudsql_user" {
  value       = module.cloudsql[0].default_user_name
  description = "CloudSQL default user"
}

output "cloudsql_db_name" {
  value       = module.cloudsql[0].default_db_name
  description = "CloudSQL default database"
}

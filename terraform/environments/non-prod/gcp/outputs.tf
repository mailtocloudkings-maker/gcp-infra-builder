# Outputs
# -----------------------------
output "cloudsql_private_ip" {
  value = var.create_cloudsql ? module.cloudsql[0].private_ip : ""
}

output "cloudsql_user" {
  value = var.create_cloudsql ? module.cloudsql[0].default_user_name : ""
}

output "cloudsql_db_name" {
  value = var.create_cloudsql ? module.cloudsql[0].default_db_name : ""
}

output "vm_name" {
  value = var.create_compute_vm ? module.compute_vm[0].vm_name : ""
}

output "vm_zone" {
  value = var.create_compute_vm ? module.compute_vm[0].vm_zone : ""
}

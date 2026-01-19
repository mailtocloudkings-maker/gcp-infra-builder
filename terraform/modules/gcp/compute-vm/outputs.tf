# -----------------------------
# VM Outputs
# -----------------------------
output "vm_name" {
  description = "The name of the VM instance"
  value       = google_compute_instance.vm.name
}

output "vm_self_link" {
  description = "Self link of the VM instance"
  value       = google_compute_instance.vm.self_link
}

output "vm_zone" {
  description = "The zone where the VM is deployed"
  value       = google_compute_instance.vm.zone
}

# -----------------------------
# CloudSQL Connection Info (Optional)
# -----------------------------
output "cloudsql_private_ip" {
  description = "Private IP of the CloudSQL instance attached to the VM (if provided)"
  value       = length(var.cloudsql_private_ip) > 0 ? var.cloudsql_private_ip : null
}

output "cloudsql_user" {
  description = "CloudSQL username configured on the VM (if provided)"
  value       = length(var.cloudsql_user) > 0 ? var.cloudsql_user : null
}

output "cloudsql_db_name" {
  description = "CloudSQL database name configured on the VM (if provided)"
  value       = length(var.cloudsql_db_name) > 0 ? var.cloudsql_db_name : null
}

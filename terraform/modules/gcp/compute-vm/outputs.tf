output "vm_name" {
  description = "The name of the VM"
  value       = google_compute_instance.vm.name
}

output "vm_self_link" {
  description = "Self link of the VM"
  value       = google_compute_instance.vm.self_link
}

output "vm_zone" {
  description = "Zone where VM is deployed"
  value       = google_compute_instance.vm.zone
}

# Optional: CloudSQL connection info passed to VM
output "cloudsql_private_ip" {
  description = "CloudSQL private IP attached to VM"
  value       = var.cloudsql_private_ip
}

output "cloudsql_user" {
  description = "CloudSQL username configured on VM"
  value       = var.cloudsql_user
}

output "cloudsql_db_name" {
  description = "CloudSQL database name configured on VM"
  value       = var.cloudsql_db_name
}

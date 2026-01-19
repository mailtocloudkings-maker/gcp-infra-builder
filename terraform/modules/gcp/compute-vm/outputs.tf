# ==============================
# VM Outputs (conditional)
# ==============================

output "vm_name" {
  description = "The name of the VM"
  value       = var.create_compute_vm && length(module.compute_vm) > 0 ? module.compute_vm[0].vm_name : ""
}

output "vm_self_link" {
  description = "The self link of the VM"
  value       = var.create_compute_vm && length(module.compute_vm) > 0 ? module.compute_vm[0].vm_self_link : ""
}

output "vm_zone" {
  description = "Zone where the VM is deployed"
  value       = var.create_compute_vm && length(module.compute_vm) > 0 ? module.compute_vm[0].vm_zone : ""
}

# Optional: CloudSQL info passed to VM
output "vm_cloudsql_private_ip" {
  description = "CloudSQL private IP attached to VM"
  value       = var.create_compute_vm && length(module.compute_vm) > 0 ? module.compute_vm[0].cloudsql_private_ip : ""
}

output "vm_cloudsql_user" {
  description = "CloudSQL username configured on VM"
  value       = var.create_compute_vm && length(module.compute_vm) > 0 ? module.compute_vm[0].cloudsql_user : ""
}

output "vm_cloudsql_db_name" {
  description = "CloudSQL database name configured on VM"
  value       = var.create_compute_vm && length(module.compute_vm) > 0 ? module.compute_vm[0].cloudsql_db_name : ""
}

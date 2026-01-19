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

output "firewall_id" {
  value       = google_compute_firewall.allow_internal.id
  description = "ID of the VM firewall"
}

output "firewall_name" {
  value       = google_compute_firewall.allow_internal.name
  description = "Name of the VM firewall"
}

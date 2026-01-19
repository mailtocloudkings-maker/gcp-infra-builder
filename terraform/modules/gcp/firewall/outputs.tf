output "firewall_internal_id" {
  value       = google_compute_firewall.allow_internal.id
  description = "ID of the internal firewall rule"
}

output "firewall_bindplane_agent_id" {
  value       = google_compute_firewall.bindplane_agent.id
  description = "ID of the BindPlane agent firewall"
}

output "firewall_bindplane_ui_id" {
  value       = google_compute_firewall.bindplane_ui.id
  description = "ID of the BindPlane UI firewall"
}

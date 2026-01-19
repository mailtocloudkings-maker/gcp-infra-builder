output "dns_zone_name" {
  value       = google_dns_managed_zone.internal.name
  description = "The name of the internal DNS zone"
}

output "dns_zone_id" {
  value       = google_dns_managed_zone.internal.id
  description = "The ID of the internal DNS zone"
}

output "dns_zone_network" {
  value       = google_dns_managed_zone.internal.private_visibility_config[0].networks[0].network_url
  description = "The network attached to the internal DNS zone"
}

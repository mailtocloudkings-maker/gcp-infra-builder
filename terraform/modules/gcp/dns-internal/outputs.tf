output "dns_zone_name" {
  value       = google_dns_managed_zone.internal.name
  description = "The name of the internal DNS zone"
}

output "dns_zone_id" {
  value       = google_dns_managed_zone.internal.id
  description = "The ID of the internal DNS zone"
}

output "dns_zone_networks" {
  description = "Networks attached to the private DNS zone"
  value = [
    for n in google_dns_managed_zone.internal.private_visibility_config[0].networks :
    n.network_url
  ]
}

# -----------------------------
# Create Internal Private DNS Zone
# -----------------------------
resource "google_dns_managed_zone" "internal" {
  name        = "${var.name_prefix}-internal-dns-${var.suffix}"
  dns_name    = "${var.domain_name}."
  description = "Internal DNS zone for Non-Prod environment"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url = var.network_id
    }
  }
}

# -----------------------------
# Create DNS Records (Dynamic)
# -----------------------------
resource "google_dns_record_set" "records" {
  for_each = {
    for record in var.records :
    "${record.name}-${record.type}" => record
  }

  managed_zone = google_dns_managed_zone.internal.name
  name         = "${each.value.name}.${var.domain_name}."
  type         = each.value.type
  ttl          = each.value.ttl
  rrdatas      = each.value.rrdatas
}

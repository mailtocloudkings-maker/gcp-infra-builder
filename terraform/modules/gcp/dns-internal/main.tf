# Create an internal DNS zone
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

# Optional: Create a sample A record pointing to 10.10.0.10
resource "google_dns_record_set" "sample_a" {
  count       = 1
  managed_zone = google_dns_managed_zone.internal.name
  name         = "app.${var.domain_name}."
  type         = "A"
  ttl          = 300
  rrdatas      = ["10.10.0.10"]
}

resource "google_monitoring_dashboard" "this" {
  dashboard_json = jsonencode({
    displayName = "${var.name_prefix}-dashboard-${var.suffix}"
  })
}

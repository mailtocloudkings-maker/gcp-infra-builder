output "dashboard_name" {
  value       = google_monitoring_dashboard.this.dashboard_json
  description = "JSON configuration of the dashboard"
}

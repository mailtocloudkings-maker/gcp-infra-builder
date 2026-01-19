resource "google_monitoring_alert_policy" "cpu" {
  display_name = "${var.name_prefix}-cpu-alert-${var.suffix}"

  conditions {
    display_name = "High CPU"
    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\""
      comparison      = "COMPARISON_GT"
      threshold_value = 0.8
      duration        = "60s"
    }
  }
}

resource "google_monitoring_alert_policy" "cpu" {
  display_name = "${var.name_prefix}-cpu-alert-${var.suffix}"
  combiner     = "OR"   # ✅ REQUIRED

  conditions {
    display_name = "High CPU Utilization"

    condition_threshold {
      filter = <<EOT
metric.type="compute.googleapis.com/instance/cpu/utilization"
resource.type="gce_instance"
EOT

      comparison      = "COMPARISON_GT"
      threshold_value = 0.8
      duration        = "300s"

      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = var.notification_channels

  alert_strategy {
    auto_close = "1800s"
  }

  enabled = true
}

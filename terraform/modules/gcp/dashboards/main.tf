resource "google_monitoring_dashboard" "this" {
  dashboard_json = jsonencode({
    displayName = "${var.name_prefix}-dashboard-${var.suffix}"

    gridLayout = {
      columns = 2
      widgets = [
        {
          title = "CPU Utilization"
          xyChart = {
            dataSets = [
              {
                timeSeriesQuery = {
                  timeSeriesFilter = {
                    filter = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\""
                    aggregation = {
                      alignmentPeriod  = "60s"
                      perSeriesAligner = "ALIGN_MEAN"
                    }
                  }
                }
              }
            ]
            yAxis = {
              label = "CPU Usage"
              scale = "LINEAR"
            }
          }
        },
        {
          title = "Disk Usage"
          xyChart = {
            dataSets = [
              {
                timeSeriesQuery = {
                  timeSeriesFilter = {
                    filter = "metric.type=\"compute.googleapis.com/instance/disk/bytes_used\""
                    aggregation = {
                      alignmentPeriod  = "60s"
                      perSeriesAligner = "ALIGN_MEAN"
                    }
                  }
                }
              }
            ]
            yAxis = {
              label = "Disk Bytes Used"
              scale = "LINEAR"
            }
          }
        }
      ]
    }
  })
}

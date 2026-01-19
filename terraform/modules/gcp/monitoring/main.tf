resource "google_monitoring_notification_channel" "email" {
  display_name = "${var.name_prefix}-email-${var.suffix}"
  type         = "email"

  labels = {
    email_address = "sarajendran@altimetrik.com"
  }
}

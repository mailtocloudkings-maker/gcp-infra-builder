resource "google_compute_forwarding_rule" "ilb" {
  name                  = "${var.name_prefix}-ilb-${var.suffix}"
  load_balancing_scheme = "INTERNAL"
  network               = var.network_id
  subnetwork            = var.subnet_id
  ports                 = ["80"]
}

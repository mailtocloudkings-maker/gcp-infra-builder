
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

# Generate unique suffix for resource names
resource "random_id" "suffix" {
  byte_length = 3
}

locals {
  unique_suffix = "${formatdate("YYYYMMDDhhmm", timestamp())}-${random_id.suffix.hex}"
  name_prefix   = "np"
}

# Default VPC and subnet
data "google_compute_network" "default_vpc" {
  name = "default"
}

data "google_compute_subnetwork" "default_subnet" {
  name   = "default"
  region = var.region
}

# -----------------------------
# Firewall Module
# -----------------------------
module "firewall" {
  count       = var.create_firewall ? 1 : 0
  source      = "../../../modules/gcp/firewall"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# -----------------------------
# Enable Service Networking
# -----------------------------
resource "google_project_service" "service_networking" {
  service = "servicenetworking.googleapis.com"
}

# -----------------------------
# Reserve IP range for CloudSQL
# -----------------------------
resource "google_compute_global_address" "private_ip_range" {
  name          = "cloudsql-private-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = data.google_compute_network.default_vpc.id
}

# -----------------------------
# Create Service Networking connection
# -----------------------------
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = data.google_compute_network.default_vpc.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_range.name]

  depends_on = [google_project_service.service_networking]
}

# -----------------------------
# CloudSQL Postgres Module
# -----------------------------
module "cloudsql" {
  count       = var.create_cloudsql ? 1 : 0
  source      = "../../../modules/gcp/cloudsql"

  name_prefix            = local.name_prefix
  suffix                 = local.unique_suffix
  region                 = var.region
  network_id             = data.google_compute_network.default_vpc.id
  default_user_password  = var.cloudsql_default_user_password
  create_default_db      = true
  default_db_name        = "appdb"
  create_default_user    = true
  default_user_name      = "appuser"

  depends_on = [google_service_networking_connection.private_vpc_connection]
}
# -----------------------------
# Compute VM Module
# -----------------------------
module "compute_vm" {
  count       = var.create_compute_vm ? 1 : 0
  source      = "../../../modules/gcp/compute-vm"

  name_prefix          = local.name_prefix
  suffix               = local.unique_suffix
  subnet_id            = data.google_compute_subnetwork.default_subnet.id
  zone                 = var.zone
  machine_type         = "e2-micro"                 # make sure this is a variable in compute-vm module
  image                = "debian-cloud/debian-11"  # make sure this is a variable in compute-vm module
  tags                 = ["vm"]

  cloudsql_private_ip  = var.create_cloudsql ? module.cloudsql[0].private_ip : ""
  cloudsql_user        = var.create_cloudsql ? module.cloudsql[0].default_user_name : ""
  cloudsql_db_name     = var.create_cloudsql ? module.cloudsql[0].default_db_name : ""
}


# -----------------------------
# Compute MIG Module
# -----------------------------
module "compute_mig" {
  count       = var.create_compute_mig ? 1 : 0
  source      = "../../../modules/gcp/compute-mig"
  subnet_id   = data.google_compute_subnetwork.default_subnet.id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# -----------------------------
# Internal Load Balancer Module
# -----------------------------
module "ilb" {
  count       = var.create_ilb ? 1 : 0
  source      = "../../../modules/gcp/load-balancer/internal"
  network_id  = data.google_compute_network.default_vpc.id
  subnet_id   = data.google_compute_subnetwork.default_subnet.id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# -----------------------------
# Internal DNS Module
# -----------------------------
module "dns_internal" {
  count       = var.create_dns_internal && var.create_ilb ? 1 : 0
  source      = "../../../modules/gcp/dns-internal"
  network_id  = data.google_compute_network.default_vpc.id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
  domain_name = "internal.nonprod.example.com"

  records = [
    {
      name    = "internal-lb"
      type    = "A"
      ttl     = 300
      rrdatas = var.create_ilb ? [module.ilb[0].lb_ip] : []
    }
  ]

  depends_on = [module.ilb]
}

# -----------------------------
# Storage Bucket Module
# -----------------------------
module "storage" {
  count       = var.create_storage ? 1 : 0
  source      = "../../../modules/gcp/storage-bucket"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# -----------------------------
# Monitoring Module
# -----------------------------
module "monitoring" {
  count       = var.create_monitoring ? 1 : 0
  source      = "../../../modules/gcp/monitoring"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# -----------------------------
# Alerts Module
# -----------------------------
module "alerts" {
  count       = var.create_alerts ? 1 : 0
  source      = "../../../modules/gcp/alerts"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# -----------------------------
# Dashboards Module
# -----------------------------
module "dashboards" {
  count       = var.create_dashboards ? 1 : 0
  source      = "../../../modules/gcp/dashboards"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

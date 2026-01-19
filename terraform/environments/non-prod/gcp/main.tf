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
  name    = "default"
  region  = var.region
  network = data.google_compute_network.default_vpc.id
}

# Firewall module
module "firewall" {
  count       = var.create_firewall ? 1 : 0
  source      = "../../../modules/gcp/firewall"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
  # Uses default VPC automatically
}

# Compute VM module
module "compute_vm" {
  count       = var.create_compute_vm ? 1 : 0
  source      = "../../../modules/gcp/compute-vm"
  subnet_id   = data.google_compute_subnetwork.default_subnet.id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
  tags        = ["vm"]  # attach to firewall
}

# Compute MIG
module "compute_mig" {
  count       = var.create_compute_mig ? 1 : 0
  source      = "../../../modules/gcp/compute-mig"
  subnet_id   = data.google_compute_subnetwork.default_subnet.id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# Internal Load Balancer
module "ilb" {
  count       = var.create_ilb ? 1 : 0
  source      = "../../../modules/gcp/load-balancer/internal"
  network_id  = data.google_compute_network.default_vpc.id
  subnet_id   = data.google_compute_subnetwork.default_subnet.id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# CloudSQL Postgres
module "cloudsql" {
  count       = var.create_cloudsql ? 1 : 0
  source      = "../../../modules/gcp/cloudsql-postgres"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# Storage Bucket
module "storage" {
  count       = var.create_storage ? 1 : 0
  source      = "../../../modules/gcp/storage-bucket"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# Monitoring
module "monitoring" {
  count       = var.create_monitoring ? 1 : 0
  source      = "../../../modules/gcp/monitoring"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# Alerts
module "alerts" {
  count       = var.create_alerts ? 1 : 0
  source      = "../../../modules/gcp/alerts"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

# Dashboards
module "dashboards" {
  count       = var.create_dashboards ? 1 : 0
  source      = "../../../modules/gcp/dashboards"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

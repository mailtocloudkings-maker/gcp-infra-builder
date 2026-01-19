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

# Generate unique suffix
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

# Enable Service Networking for CloudSQL
resource "google_project_service" "service_networking" {
  service = "servicenetworking.googleapis.com"
}
# -----------------------------
# Reserve IP range for CloudSQL (unique)
# -----------------------------
resource "google_compute_global_address" "private_ip_range" {
  name          = "cloudsql-private-range-${random_id.suffix.hex}"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = data.google_compute_network.default_vpc.id
}

# -----------------------------
# Create Service Networking connection with unique IP range
# -----------------------------
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = data.google_compute_network.default_vpc.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_range.name]

  depends_on = [google_project_service.service_networking]
}


# -----------------------------
# CloudSQL PostgreSQL Module
# -----------------------------
module "cloudsql" {
  count       = var.create_cloudsql ? 1 : 0
  source      = "../../../modules/gcp/cloudsql"

  name_prefix            = local.name_prefix
  suffix                 = local.unique_suffix
  region                 = var.region
  network_id             = data.google_compute_network.default_vpc.id
  default_user_password  = var.cloudsql_default_user_password

  depends_on = [google_service_networking_connection.private_vpc_connection]
}

# -----------------------------
# Compute VM Module
# -----------------------------
module "compute_vm" {
  count       = var.create_compute_vm ? 1 : 0
  source      = "../../../modules/gcp/compute-vm"

  name_prefix         = local.name_prefix
  suffix              = local.unique_suffix
  subnet_id           = data.google_compute_subnetwork.default_subnet.id
  zone                = var.zone
  machine_type        = "e2-micro"
  image               = "debian-cloud/debian-11"
  tags                = ["vm"]

  # CloudSQL info for VM
  cloudsql_private_ip = var.create_cloudsql ? module.cloudsql[0].private_ip : ""
  cloudsql_user       = var.create_cloudsql ? module.cloudsql[0].default_user_name : ""
  cloudsql_db_name    = var.create_cloudsql ? module.cloudsql[0].default_db_name : ""
}

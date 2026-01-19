terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "random_id" "suffix" {
  byte_length = 3
}

locals {
  unique_suffix = "${formatdate("YYYYMMDDhhmm", timestamp())}-${random_id.suffix.hex}"
  name_prefix   = "np"
}

module "vpc" {
  count       = var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/vpc"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

module "firewall" {
  count       = var.create_firewall && var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/firewall"
  network_id  = module.vpc[0].vpc_id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

module "dns_internal" {
  count       = var.create_dns && var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/dns-internal"
  network_id  = module.vpc[0].vpc_id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

module "compute_vm" {
  count       = var.create_compute_vm && var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/compute-vm"
  subnet_id   = module.vpc[0].subnet_id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

module "compute_mig" {
  count       = var.create_compute_mig && var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/compute-mig"
  subnet_id   = module.vpc[0].subnet_id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

module "ilb" {
  count       = var.create_ilb && var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/load-balancer/internal"
  network_id  = module.vpc[0].vpc_id
  subnet_id   = module.vpc[0].subnet_id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

module "cloudsql" {
  count       = var.create_cloudsql && var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/cloudsql"
  network_id  = module.vpc[0].vpc_id
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

module "storage" {
  count       = var.create_storage ? 1 : 0
  source      = "../../../modules/gcp/storage-bucket"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

module "monitoring" {
  count       = var.create_monitoring ? 1 : 0
  source      = "../../../modules/gcp/monitoring"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

module "alerts" {
  count       = var.create_alerts ? 1 : 0
  source      = "../../../modules/gcp/alerts"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

module "dashboards" {
  count       = var.create_dashboards ? 1 : 0
  source      = "../../../modules/gcp/dashboards"
  name_prefix = local.name_prefix
  suffix      = local.unique_suffix
}

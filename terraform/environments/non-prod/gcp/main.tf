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
}

resource "random_id" "suffix" {
  byte_length = 2
}

locals {
  org         = "metro"
  environment = "nonprod"
  name_prefix = "${local.org}-${local.environment}"
  suffix      = random_id.suffix.hex
}

module "vpc" {
  count       = var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/vpc"
  project_id  = var.project_id
  name_prefix = local.name_prefix
  suffix      = local.suffix
}

module "firewall" {
  count       = var.create_firewall && var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/firewall"
  network_id  = module.vpc[0].vpc_id
  name_prefix = local.name_prefix
  suffix      = local.suffix
}

module "dns_internal" {
  count       = var.create_dns_internal && var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/dns-internal"
  project_id  = var.project_id
  network_id  = module.vpc[0].vpc_id
  name_prefix = local.name_prefix
  suffix      = local.suffix
}

module "compute_vm" {
  count       = var.create_compute_vm && var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/compute-vm"
  subnet_id   = module.vpc[0].subnet_id
  name_prefix = local.name_prefix
  suffix      = local.suffix
}

module "cloudsql_postgres" {
  count       = var.create_cloudsql_postgres && var.create_vpc ? 1 : 0
  source      = "../../../modules/gcp/cloudsql-postgres"
  network_id  = module.vpc[0].vpc_id
  name_prefix = local.name_prefix
  suffix      = local.suffix
}

module "storage" {
  count       = var.create_storage ? 1 : 0
  source      = "../../../modules/gcp/storage-bucket"
  name_prefix = local.name_prefix
  suffix      = local.suffix
}

module "monitoring" {
  count       = var.create_monitoring ? 1 : 0
  source      = "../../../modules/gcp/monitoring"
  name_prefix = local.name_prefix
  suffix      = local.suffix
}

variable "name_prefix" {
  description = "Prefix for CloudSQL instance"
  type        = string
}

variable "suffix" {
  description = "Unique suffix for the instance"
  type        = string
}

variable "region" {
  description = "Region for CloudSQL"
  type        = string
  default     = "us-central1"
}

variable "tier" {
  description = "Machine type tier for CloudSQL"
  type        = string
  default     = "db-f1-micro"
}

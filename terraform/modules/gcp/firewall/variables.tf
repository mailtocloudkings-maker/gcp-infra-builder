variable "network_id" {
  description = "ID of the VPC network"
  type        = string
}

variable "name_prefix" {
  description = "Prefix for firewall name"
  type        = string
}

variable "suffix" {
  description = "Unique suffix for resource name"
  type        = string
}

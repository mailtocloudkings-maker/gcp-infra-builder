# The network to attach the firewall to
variable "network_id" {
  description = "ID of the VPC network"
  type        = string
}

# Prefix for naming
variable "name_prefix" {
  description = "Prefix for firewall name"
  type        = string
}

# Unique suffix for naming
variable "suffix" {
  description = "Unique suffix for resource name"
  type        = string
}

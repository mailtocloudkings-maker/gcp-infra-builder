# Subnet to attach the VM to
variable "subnet_id" {
  description = "ID of the subnet where VM will be deployed"
  type        = string
}

# Prefix for VM name
variable "name_prefix" {
  description = "Prefix for the VM name"
  type        = string
}

# Unique suffix for VM name
variable "suffix" {
  description = "Unique suffix for the VM name"
  type        = string
}

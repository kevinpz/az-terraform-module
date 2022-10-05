# Location to deploy the validation VM
variable "location" {
  type = string
}

# RG name
variable "rg_name" {
  type = string
}

# Subnet name
variable "subnet_id" {
  type = string
}

# VM password
variable "vm_password" {
  type = string
}

# Name of the project
variable "project_name" {
  type = string
}
# Location to deploy the validation VM
variable "location" {
  type = string
}

# RG name
variable "rg_name" {
  type = string
}

# Principal ID of the user
variable "principal_id" {
  type = string
}

# Name of the project
variable "project_name" {
  type = string
}
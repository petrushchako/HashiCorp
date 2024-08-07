# Variable to define the AWS region where resources will be deployed.
variable "region" {
  description = "The AWS region where all resources will be deployed."
  type        = string
  default     = "us-west-2"  # Default value. Can be overridden in terraform.tfvars or via command line arguments.
}

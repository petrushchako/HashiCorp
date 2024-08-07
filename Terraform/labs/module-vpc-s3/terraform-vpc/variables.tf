# Variable to specify the AWS region for VPC deployment.
variable "region" {
  description = "The AWS region where the VPC and its resources will be created."
  type        = string
  # Must be defined in the root module's terraform.tfvars file or passed directly in the Terraform command.
}

# Variable to define the CIDR block for the VPC.
variable "vpc_cidr" {
  description = "The CIDR block for the VPC, defining its IP address range."
  type        = string
  # Must be defined in the root module's terraform.tfvars file or passed directly in the Terraform command.
}

# Variable to provide a list of CIDR blocks for public subnets in the VPC.
variable "public_subnets" {
  description = "A list of CIDR blocks for the VPC's public subnets."
  type        = list(string)
  # Must be defined in the root module's terraform.tfvars file or passed directly in the Terraform command.
}

# Variable to specify a list of availability zones for resource deployment.
variable "azs" {
  description = "A list of availability zones in the AWS region for deploying resources."
  type        = list(string)
  # Must be defined in the root module's terraform.tfvars file or passed directly in the Terraform command.
}

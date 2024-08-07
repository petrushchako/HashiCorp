# Variable to specify the AWS region where the S3 bucket will be created.
variable "region" {
  description = "The AWS region where the S3 bucket will be located."
  type        = string
  # Must be defined in the root module's terraform.tfvars file or passed directly in the Terraform command.
}

# Variable to define the globally unique name for the S3 bucket.
variable "bucket_name" {
  description = "The unique name for the S3 bucket. Must be globally unique."
  type        = string
  # Must be defined in the root module's terraform.tfvars file or passed directly in the Terraform command.
}

variable "environment" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
}

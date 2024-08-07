variable "region" {
  description = "The AWS region to deploy to"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "environment" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
}

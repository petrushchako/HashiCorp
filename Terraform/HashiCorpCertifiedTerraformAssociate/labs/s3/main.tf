provider "aws" {
  region = "eu-west-1"
}

# Generate a unique name
resource "random_pet" "bucket_name"{
  length     = 2
  separator  = "-"
}

# Create the S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-${random_pet.bucket_name.id}"

  tags = {
    Name        = "Terraform Bucket"
    Environment = "Test"
  }
}

# Output bucket name
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}


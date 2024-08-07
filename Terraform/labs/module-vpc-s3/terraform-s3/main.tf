# Define the S3 bucket resource
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name  # Name of the S3 bucket
  acl    = "private"  # Access control list setting to make the bucket private

  tags = {
    Name        = var.bucket_name  # Tag for the bucket with its name
    Environment = var.environment  # Tag for the bucket indicating the environment (e.g., dev)
  }
}

# Output the bucket ARN
output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn  # Return the ARN of the S3 bucket
}

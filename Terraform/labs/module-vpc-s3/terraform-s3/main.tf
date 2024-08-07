resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

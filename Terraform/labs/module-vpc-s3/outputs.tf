output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "bucket_arn" {
  value = module.s3.bucket_arn
}

output "instance_id" {
  value = aws_instance.web.id
}

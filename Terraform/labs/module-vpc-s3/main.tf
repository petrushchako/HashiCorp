provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./terraform-vpc"  # Path to the VPC module directory

  region         = var.region
  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  azs            = ["us-west-2a", "us-west-2b"]
}

module "s3" {
  source = "./terraform-s3"  # Path to the S3 Bucket module directory

  region      = var.region
  bucket_name = "my-unique-bucket-name"
  environment = "dev"
}

resource "aws_instance" "web" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = element(module.vpc.public_subnet_ids, 0)

  tags = {
    Name = "web-instance"
  }
}

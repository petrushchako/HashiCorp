# Define the AWS provider to interact with AWS services
provider "aws" {
  region = "us-west-2"  # Set the AWS region to us-west-2
}

# Reference the VPC module
module "vpc" {
  source = "./terraform-vpc"  # Path to the VPC module directory

  # Pass variables to the VPC module
  region         = var.region
  vpc_cidr       = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  azs            = ["us-west-2a", "us-west-2b"]
}

# Reference the S3 Bucket module
module "s3" {
  source = "./terraform-s3"  # Path to the S3 Bucket module directory

  # Pass variables to the S3 module
  region      = var.region
  bucket_name = "my-unique-bucket-name"
  environment = "dev"
}

# Define an EC2 instance resource
resource "aws_instance" "web" {
  ami           = "ami-12345678"  # Amazon Machine Image ID for the EC2 instance
  instance_type = "t2.micro"  # Instance type (e.g., t2.micro for small instances)
  subnet_id     = element(module.vpc.public_subnet_ids, 0)  # Use the first public subnet ID from the VPC module

  tags = {
    Name = "web-instance"  # Tag for the EC2 instance with the name "web-instance"
  }
}

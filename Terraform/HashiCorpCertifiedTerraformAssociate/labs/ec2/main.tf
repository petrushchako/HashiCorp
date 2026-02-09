terraform{
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }
    }
}

provider "aws" {
    region = "eu-west-1"
    profile = "default"
}

# Automatically find the latest Amazon Linux 2023 Automatically
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
}


 # Create EC2 instance

 resource "aws_instance" "my_ec2_instance" {
    ami = data.aws_ami.latest_amazon_linux.id
    instance_type = "t3.micro"

    tags = {
        Name = "terraform-ec2"
    }
 }


# Output the public IP and AMI
output "instance_ami" {
    value = data.aws_ami.latest_amazon_linux.id
}


output "instance_public_ip" {
    value = aws_instance.my_ec2_instance.public_ip
}
# Define the VPC resource
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr  # CIDR block for the VPC
}

# Define the public subnet resources
resource "aws_subnet" "public" {
  count                   = length(var.public_subnets)  # Create multiple subnets based on the length of the public_subnets variable
  vpc_id                  = aws_vpc.main.id  # Associate the subnet with the VPC
  cidr_block              = var.public_subnets[count.index]  # Set the CIDR block for each subnet
  availability_zone       = var.azs[count.index]  # Set the availability zone for each subnet
  map_public_ip_on_launch = true  # Automatically assign a public IP address to instances launched in this subnet
}

# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.main.id
}

# Output the public subnet IDs
output "public_subnet_ids" {
  value = aws_subnet.public[*].id  # Return the IDs of all public subnets
}

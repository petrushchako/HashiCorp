provider "aws" {
  region = "eu-west-1"
}


resource "aws_instance" "my-first-vm" {
  ami                         = "ami-0ca708d12ecae12cb"
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [aws_security_group.instance.id]
  user_data_replace_on_change = true
  user_data                   = <<-EOF
              #!/bin/bash
              # Create the directory and file
              mkdir -p /home/ec2-user
              cd /home/ec2-user
              echo "Hello from Terraform EC2 via Python" > index.html
              
              # Run Python's built-in web server on port 8080
              # Python 3 version:
              nohup python3 -m http.server ${var.server_port} &
              EOF
  tags = {
    Name = "terraform-example"
  }
}


resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  # Incoming traffic
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Outgoing traffic (The missing piece)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "public_ip" {
  value       = aws_instance.my-first-vm.public_ip
  description = "Public IP address of the web server"
}
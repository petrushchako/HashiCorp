provider "aws" {
    region = "eu-west-1"
}


resource "aws_instance" "my-first-vm" {
    ami             = "ami-0ca708d12ecae12cb"
    instance_type   = "t3.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]
    user_data_replace_on_change = true
    user_data = <<-EOF
                #!/bin/bash
                echo "Hello from Terraform EC2" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
    tags = {
        Name = "terraform-example"
    }
}


resource "aws_security_group" "instance" {
    name = "terraform-example-instance"
    # Incoming traffic
    ingress {
        from_port   = 8080
        to_port     = 8080
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

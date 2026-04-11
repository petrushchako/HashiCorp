provider "aws" {
    region = "eu-west-1"
}

resource "aws_instance" "my-first-vm" {
    ami             = "ami-0ca708d12ecae12cb"
    instance_type   = "t3.micro"
}
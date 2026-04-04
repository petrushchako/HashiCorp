resource "aws_instance" "example" {
  ami           = "ami-ofb653ca2d3203ac1"
  instance_type = "t3.micro"
  availability_zone = "eu-west-1a"
  tags = {
    Name = "HelloWorld"
  }

  user_data = file("ad-hoc-script.sh")
}
# Define the source (The "builder" in json)
source "amazon-ebs" "example" {
    ami_name = "packer-example{{timestamp}}"
    instance_type = "t2.micro"
    region = "eu-west-1"
    ssh_user = "ubuntu"
    source_ami = "ami0fb653ca2d3203ac1"
}

# Define the builder process
build {
    sources = ["source.amazon-ebs.example"]

    provisioner "shell" {
        pause_before = "60s"
        environment_vars = [
            "DEBIAN_FRONTEND=noninteractive"
        ]
        inline = [
            "sudo apt-get update",
            "sudo apt-get install -y php apache2",
            "sudo git clone https://github.com/brikis98/php-app.git /var/www/html/app"
        ]
    }
}
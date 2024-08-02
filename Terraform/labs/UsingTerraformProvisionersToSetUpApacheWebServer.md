# Using Terraform Provisioners to Set up an Apache Web Server on AWS
### Introduction
In this hands-on lab, we'll be using a Terraform provisioner to custom bootstrap a VM in AWS and install a webserver on it, and then test that the webserver is working as expected.

## Solution
## Clone Terraform Code and Switch to the Proper Directory
1. Clone the required code from the provided repository:

    `git clone https://github.com/linuxacademy/content-hashicorp-certified-terraform-associate-foundations.git`

2. Switch to the directory where the code is located:

    `cd content-hashicorp-certified-terraform-associate-foundations/section3-hol2/`

3. List the files in the directory:

    `ls`

    The files in the directory should include `main.tf`, `README.md`, and `setup.tf`.

<br><br>

## Examine the Code in the main.tf File

1. View the contents of the main.tf file using the cat command:

    `cat main.tf`

    ```hcl
    #Create and bootstrap webserver
    resource "aws_instance" "webserver" {
        ami                         = data.aws_ssm_parameter.webserver-ami.value
        instance_type               = "t3.micro"
        key_name                    = aws_key_pair.webserver-key.key_name
        associate_public_ip_address = true
        vpc_security_group_ids      = [aws_security_group.sg.id]
        subnet_id                   = aws_subnet.subnet.id
        provisioner "remote-exec" {
            inline = [
                "sudo yum -y install httpd && sudo systemctl start httpd",
                "echo '<h1><center>My Test Website With Help From Terraform Provisioner</center></h1>' > index.html",
                "sudo mv index.html /var/www/html/"
            ]
            connection {
                type        = "ssh"
                user        = "ec2-user"
                private_key = file("~/.ssh/id_rsa")
                host        = self.public_ip
            }
        }
        tags = {
            Name = "webserver"
        }
    }
    ```

    <br>

    `setup.tf`
    ```hcl
    provider "aws" {
        region = "us-east-1"
    }

    #Create key-pair for logging into EC2 in us-east-1
    resource "aws_key_pair" "webserver-key" {
        key_name   = "webserver-key"
        public_key = file("~/.ssh/id_rsa.pub")
    }


    #Get Linux AMI ID using SSM Parameter endpoint in us-east-1
    data "aws_ssm_parameter" "webserver-ami" {
        name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
    }

    #Create VPC in us-east-1
    resource "aws_vpc" "vpc" {
        cidr_block           = "10.0.0.0/16"
        enable_dns_support   = true
        enable_dns_hostnames = true
        tags = {
            Name = "terraform-vpc"
        }
    }

    #Create IGW in us-east-1
    resource "aws_internet_gateway" "igw" {
        vpc_id = aws_vpc.vpc.id
    }

    #Get main route table to modify
    data "aws_route_table" "main_route_table" {
        filter {
            name   = "association.main"
            values = ["true"]
        }
        filter {
            name   = "vpc-id"
            values = [aws_vpc.vpc.id]
        }
    }

    #Create route table in us-east-1
    resource "aws_default_route_table" "internet_route" {
        default_route_table_id = data.aws_route_table.main_route_table.id
        route {
            cidr_block = "0.0.0.0/0"
            gateway_id = aws_internet_gateway.igw.id
        }
        tags = {
            Name = "Terraform-RouteTable"
        }
    }

    #Get all available AZ's in VPC for master region
    data "aws_availability_zones" "azs" {
        state = "available"
    }

    #Create subnet # 1 in us-east-1
    resource "aws_subnet" "subnet" {
        availability_zone = element(data.aws_availability_zones.azs.names, 0)
        vpc_id            = aws_vpc.vpc.id
        cidr_block        = "10.0.1.0/24"
    }

    #Create SG for allowing TCP/80 & TCP/22
    resource "aws_security_group" "sg" {
        name        = "sg"
        description = "Allow TCP/80 & TCP/22"
        vpc_id      = aws_vpc.vpc.id
        ingress {
            description = "Allow SSH traffic"
            from_port   = 22
            to_port     = 22
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        ingress {
            description = "allow traffic from TCP/80"
            from_port   = 80
            to_port     = 80
            protocol    = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
        egress {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    output "Webserver-Public-IP" {
        value = aws_instance.webserver.public_ip
    }
    ```


2. Examine the code in the `resource` block and note the following:
   - We are creating an AWS EC2 instance (virtual machine) named `webserver`.
    - We are passing a number of parameters for the resource, such as the AMI that the VM will be spun up as, the instance type, the private key that the instance will be using, the public IP attached to the instance, the security group applied to the instance, and the subnet ID where the VM will be spun up.

        > Note: All of these resources are actually being created via the setup.tf file, which you can view if desired.

3. Examine the code in the `provisioner` block and note the following:
    - The `remote-exec` keyword tells us that this is a remote provisioner, which invokes a script on a remote resource after it is created.
    - The provisioner is using the parameters configured in the embedded `connection` block to connect to the AWS EC2 instance being created.
    - The provisioner will then issue the commands configured in the `inline` block to install Apache webserver on CentOS through the `yum` package manager, start up the Apache server, create a single web page called My Test Website With Help From Terraform Provisioner as an `index.html` file, and move that file into the data directory of the webserver to be served out globally.

<br><br>

## Deploy the Code and Access the Bootstrapped Webserver
1. Initialize the Terraform working directory, and download the required providers:

    `terraform init`

2. Validate the code to look for any errors in syntax, parameters, or attributes within Terraform resources that may prevent it from deploying correctly:

    `terraform validate`

   You should receive a notification that the configuration is valid.

3. Review the actions that will be performed when you deploy the Terraform code:

    `terraform plan`

    In this case, it will create `7` resources as configured in the Terraform code.

4. Deploy the code:

    `terraform apply`

5. When prompted, type `yes`, and press `Enter`.

6. As the code is being deployed, you will notice that the Terraform provisioner tries to connect to the EC2 instance, and once that connection is established, it will run the bootstrapping that was configured in the `provisioner` block against the instance.
7. When complete, it will output the public IP for the Apache webserver as the `Webserver-Public-IP` value.
8. Copy the IP address, paste it in a new browser window or tab, and press Enter.
9. Verify that the web page displays as My Test Website With Help From Terraform Provisioner, validating that the provisioner within your code worked as intended. The commands configured in the `provisioner` code were issued and executed successfully on the EC2 instance that was created.
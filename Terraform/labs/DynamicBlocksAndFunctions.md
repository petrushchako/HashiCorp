# Using Terraform Dynamic Blocks and Built-in Functions to Deploy to AWS

### ABOUT THIS LAB
Terraform offers a strong set of features to help optimize your Terraform code. Two really useful features are dynamic blocks, which allow you to generate static repeated blocks within resources in Terraform; and built-in functions, which help you manipulate variables and data to suit your needs and help make your Terraform deployments better automated and more fault resilient.


### LEARNING OBJECTIVES
- Check Terraform Status
- Clone Terraform Code and Switch to Proper Directory
- Examine the Code in the Files
- Review and Deploy the Terraform Code
- Test Out the Deployment and Clean Up


<br><br>

## Solution

<br><br>

## Check Terraform Status

1. Check the Terraform status using the version command:

    `terraform version`

<br><br>

## Clone Terraform Code and Switch to Proper Directory

1. Pull terraform code from remote repository and navigate to files location:

```sh
git clone https://github.com/linuxacademy/content-hashicorp-certified-terraform-associate-foundations.git
cd lab_code
cd section7-HoL-TF-DynBlocks-Funcs
```

The files in the directory should include:
    - main.tf
    - outputs.tf
    - script.sh
    - variables.tf.


<br><br>

## Examine the Code in the Files

1. View the contents of the main.tf file using the less command:

    `less main.tf`

- The `main.tf` file spins up AWS networking components such as a virtual private cloud (VPC), security group, internet gateway, route tables, and an EC2 instance bootstrapped with an Apache webserver which is publicly accessible.

    ```hcl
    provider "aws" {
        region = "us-east-1"
    }

    data "aws_ssm_parameter" "ami_id" {
        name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
    }

    module "vpc" {
        source = "terraform-aws-modules/vpc/aws"
        name = "my-vpc"
        cidr = "10.0.0.0/16"
        azs            = ["us-east-1a"]
        public_subnets = ["10.0.1.0/24"]
    }

    resource "aws_security_group" "my-sg" {
        vpc_id = module.vpc.vpc_id
        name   = join("_", ["sg", module.vpc.vpc_id])
        dynamic "ingress" {
            for_each = var.rules
            content {
                from_port   = ingress.value["port"]
                to_port     = ingress.value["port"]
                protocol    = ingress.value["proto"]
                cidr_blocks = ingress.value["cidr_blocks"]
            }
        }
        
        egress {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_blocks = ["0.0.0.0/0"]
        }

        tags = {
            Name = "Terraform-Dynamic-SG"
        }
    }

    resource "aws_instance" "my-instance" {
        ami             = data.aws_ssm_parameter.ami_id.value
        subnet_id       = module.vpc.public_subnets[0]
        instance_type   = "t3.micro"
        security_groups = [aws_security_group.my-sg.id]
        user_data       = fileexists("script.sh") ? file("script.sh") : null
    }
    ```

    - We have selected `AWS` as our `provider` and our resources will be deployed in the `us-east-1` region.
    - We are using the `ssm_parameter` public endpoint `resource` to get the `AMI ID` of the Amazon Linux 2 image that will spin up the EC2 webserver.
    - We are using the `vpc` module (provided by the Terraform Public Registry) to create our network components like `subnets`, `internet gateway`, and `route tables`.
    - For the `security_group resource`, we are using a `dynamic block` on the `ingress` attribute to dynamically generate as many ingress blocks as we need. The dynamic block includes the `var.rules` complex variable configured in the `variables.tf` file.
    - We are also using a couple of built-in functions and some logical expressions in the code to get it to work the way we want, including the `join` function for the name attribute in the security group resource, and the `fileexists` and file functions for the `user_data` parameter in the EC2 instance resource.

2. View the contents of the variables.tf file:

    `less variables.tf`

- The `variables.tf` file contains the complex variable type which we will be iterating over with the dynamic block in the `main.tf` file.

    ```hcl
    variable "rules" {
        type = list(object({
            port        = number
            proto       = string
            cidr_blocks = list(string)
        }))
        default = [
            {
                port        = 80
                proto       = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
            },
            {
                port        = 22
                proto       = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
            },
            {
                port        = 3689
                proto       = "tcp"
                cidr_blocks = ["6.7.8.9/32"]
            }
        ]
    }
    ```

3. View the contents of the `script.sh` file using the cat command:

    `cat script.sh`

    ```sh
    #!/bin/bash
    sudo yum -y install httpd
    sudo systemctl start httpd && sudo systemctl enable httpd
    ```

    - The `script.sh` file is passed into the EC2 instance using its `user_data attribute` and the `fileexists` and file functions (as you saw in the main.tf file), which then installs the Apache webserver and starts up the service.

4. View the contents of the outputs.tf file:

    `cat outputs.tf`

    ```hcl
    output "Web-Server-URL" {
        description = "Web-Server-URL"
        value       = join("", ["http://", aws_instance.my-instance.public_ip])
    }

    output "Time-Date" {
        description = "Date/Time of Execution"
        value       = timestamp()
    }
    ```

    The `outputs.tf` file returns the values we have requested upon deployment of our Terraform code.

    - The `Web-Server-URL output` is the publicly accessible URL for our webserver. Notice here that we are using the join function for the value parameter to generate the URL for the webserver.
    - The `Time-Date output` is the timestamp when we executed our Terraform code.

<br><br>
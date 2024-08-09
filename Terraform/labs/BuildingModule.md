# Building and Testing a Basic Terraform Module

### Introduction
Terraform modules are a good way to abstract out repeated chunks of code, making it reusable across other Terraform projects and configurations. In this hands-on lab, we'll be writing a basic Terraform module from scratch and then testing it out.

### Learning Objectives
- Create the Directory Structure for the Terraform Project
- Write Your Terraform VPC Module Code
- Write Your Main Terraform Project Code
- Deploy Your Code and Test Out Your Module


<br><br>


## Solution

## Create the Directory Structure for the Terraform Project
- Check the Terraform status using the version command:

    `terraform version`

    Since the Terraform version is returned, you have validated that the Terraform binary is installed and functioning properly.

- Create following lab structure:
  
    ```sh
    terraform_project
    ├── modules
    │    └── vpc
    │        ├── main.tf
    │        ├── variables.tf
    │        └── outputs.tf
    ├── main.tf
    └── outputs.tf
    ```

<br>

## Write Your Terraform VPC Module Code
- `terraform_project/modules/vpc/main.tf`:
    ```hcl
    provider "aws" {
        region = var.region
    }

    resource "aws_vpc" "this" {
        cidr_block = "10.0.0.0/16"
    }

    resource "aws_subnet" "this" {
        vpc_id     = aws_vpc.this.id
        cidr_block = "10.0.1.0/24"
    }

    data "aws_ssm_parameter" "this" {
        name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
    }
    ```

- `terraform_project/modules/vpc/variables.tf`:

    ```hcl
        variable "region" {
        type    = string
        default = "us-east-1"
    }
    ```
- `terraform_project/modules/vpc/outputs.tf`:

    ```hcl
        output "subnet_id" {
        value = aws_subnet.this.id
    }

    output "ami_id" {
        value = data.aws_ssm_parameter.this.value
    }
    ```

    > Note: The code in outputs.tf is critical to exporting values to your main Terraform code, where you'll be referencing this module. Specifically, it returns the subnet and AMI IDs for your EC2 instance.


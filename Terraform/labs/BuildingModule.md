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

<br><br>

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

<br><br>

## Write Your Main Terraform Project Code
- `terraform_project/main.tf`:
    ```hcl
    variable "main_region" {
        type    = string
        default = "us-east-1"
    }

    provider "aws" {
        region = var.main_region
    }

    module "vpc" {
        source = "./modules/vpc"
        region = var.main_region
    }

    resource "aws_instance" "my-instance" {
        ami           = module.vpc.ami_id
        subnet_id     = module.vpc.subnet_id
        instance_type = "t2.micro"
    }
    ```

    > Note: The code in main.tf invokes the VPC module that you created earlier. Notice how you're referencing the code using the source option within the module block to let Terraform know where the module code resides.

- `terraform_project/outputs.tf`:

    ```hcl
    output "PrivateIP" {
        description = "Private IP of EC2 instance"
        value       = aws_instance.my-instance.private_ip
    }
    ```

<br>


## Deploy Your Code and Test Out Your Module
- Format the code in all of your files in preparation for deployment:

    `terraform fmt -recursive`

- Initialize the Terraform configuration to fetch any required providers and get the code being referenced in the module block:

    `terraform init`

- Validate the code to look for any errors in syntax, parameters, or attributes within Terraform resources that may prevent it from deploying correctly:

    `terraform validate`

    > You should receive a notification that the configuration is valid.

- Review the actions that will be performed when you deploy the Terraform code:

    `terraform plan`

    In this case, it will create **3 resources**, which includes the EC2 instance configured in the root code and any resources configured in the module. If you scroll up and view the resources that will be created, any resource with `module.vpc` in the name will be created via the module code, such as `module.vpc.aws_vpc.this`.

- Deploy the code:

    `terraform apply --auto-approve`

    > Note: The `--auto-approve` flag will prevent Terraform from prompting you to enter yes explicitly before it deploys the code.

- Once the code has executed successfully, note in the output that **3 resources** have been created and the **private IP** address of the EC2 instance is returned as was configured in the `outputs.tf` file in your main project code.

- View all of the resources that Terraform has created and is now tracking in the state file:

    `terraform state list`

    The list of resources should include your EC2 instance, which was configured and created by the main Terraform code, and 3 resources with module.vpc in the name, which were configured and created via the module code.

- Tear down the infrastructure you just created before moving on:

    `terraform destroy`

    > When prompted, type `yes` and press Enter.


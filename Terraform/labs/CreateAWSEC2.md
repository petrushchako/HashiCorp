# Deploying a VM in AWS Using the Terraform Workflow

### ABOUT THIS LAB
In this hands-on lab, we will be following the Terraform workflow — Write > Plan > Apply — to deploy a virtual machine (VM) in AWS. After a successful deployment, we will then clean up our infrastructure and destroy the resource we created.

### LEARNING OBJECTIVES
- Create a Directory and Write Your Terraform Code (Write)
- Plug the Provided AMI and Subnet ID Values Into Your Code
- Initialize and Review Your Terraform Code (Plan)
- Deploy Your Terraform Code (Apply), Verify Your Resources, and Clean Up


## Solution

### Create a Directory and Write Your Terraform Code (Write)
- In the CLI, create a new directory in the cloud_user's home directory called `terraform_code` to house your Terraform code:
    ```sh
    mkdir terraform_code
    ```
- Switch to the new directory:
    `cd terraform_code`

- Using `vi`, create a new file called `main.tf` where you will write your code:
- In the file, paste the provided code that will be used to create the required VM (EC2 instance) in AWS:
  
    ```hcl
    provider "aws" {
        region = "us-east-1"
    }
    resource "aws_instance" "vm" {
        ami           = "DUMMY_VALUE_AMI_ID"
        subnet_id     = "DUMMY_VALUE_SUBNET_ID"
        instance_type = "t3.micro"
        tags = {
            Name = "my-first-tf-node"
        }
    }
    ```

<br>

### Plug the Provided AMI and Subnet ID Values Into Your Code
- View the contents of the `resource_ids.txt` file that has been saved on the lab server:

`cat /home/cloud_user/resource_ids.txt`

- The `ami` and `subnet_id` values that have been saved in this file will be displayed.
- Copy the `ami` value.
- Open the main.tf file that houses your code:

    `vi main.tf`

- Paste the `ami` value into your code for the `ami` parameter, replacing the `DUMMY_VALUE_AMI_ID` placeholder text. (Note: You can add the subnet_id value at this step as well if you wish).
- Copy the `subnet_id` value.
- Open the file with your code again `vi main.tf`
- Paste the `subnet_id` value into your code for the `subnet_id` parameter, replacing the `DUMMY_VALUE_SUBNET_ID` placeholder text.

<br>

### Initialize and Review Your Terraform Code (Plan)

- Initialize the Terraform configuration and download the required providers:
    `terraform init`

- Review the actions that will be performed when you deploy your code:
    `terraform plan`

- In this case, it will create 1 resource: the EC2 instance you configured in your code.

    If you scroll up, you will notice that only the `ami`, `instance_type`, `subnet_id`, and `tags` properties are configured, as that was included in your code.

    Everything else, denoted with a + sign, will be created from scratch or will be populated when Terraform creates the resource upon deployment of your code.


<br>

### Deploy Your Terraform Code (Apply), Verify Your Resources
- Deploy the code:
    `terraform apply`

- When prompted, type yes and press Enter.
- Once the code has executed successfully, note in the output that 1 resource has been created.
> Note: You could also use the terraform output command at any time in the CLI to view the output on demand.

- Verify that the resource was created correctly in the AWS Management Console:
    - Navigate to the AWS Management Console in your browser.
    - Type EC2 in the search bar and select EC2 from the contextual menu.
    - On the Resources page, click Instances (running).
    - Verify that the instance, named m`y-first-tf-node` (as configured in your code), appears in the list.



<br>

### Clean Up Your Terraform Deployed Resources (Destroy)
- Back in the CLI, remove the infrastructure you just created:
    `terraform destroy`

- In the plan output, notice that it will destroy 1 resource: the EC2 instance you just created.

> Note: You can also scroll through the rest of the plan output and view the properties of the resource that will be destroyed, if desired.

- When prompted, type yes and press Enter.
- In the notifications displayed in the CLI, note that the `aws_instance.vm` resource you created is now being destroyed.
- In the AWS Management Console, click the refresh button inside the Instances page and verify that the `my-first-tf-node` instance no longer appears in the list.
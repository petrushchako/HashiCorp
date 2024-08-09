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



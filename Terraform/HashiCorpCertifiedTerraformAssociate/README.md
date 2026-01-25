# HashiCorp Certified Terraform Associate

> [Course link](https://app.pluralsight.com/ilx/hashicorp-certified-terraform-associate/course-overview)
> 
> [Terraform Exam Objectives Offical Review Page](https://developer.hashicorp.com/terraform/tutorials/certification-004/associate-review-004)



### Table of contents

1. Introduction
    - Exam Blueprint
    - Why Get Terraform Certified?

2. Understanding Infrastructure As Code
    - IaC and Its Benefits
    - Cloud Agnostic IaC with Terraform

3. IaC with Terraform
    - What is the Terraform Workflow?
    - Terraform Init (Initializing the Working Directory)
    - Terraform Key Concepts: Plan, Apply, and Destroy
    - Resource Addressing in Terraform: Understanding Terraform Code
    - `DEMO` Deploying a VM in AWS Using the Terraform Workflow

4. Terraform Fundamentals
    - Installing Terraform and Terraform Providers
    - Terraform State: The Concept
    - Terraform Variables and Outputs
    - Terraform Provisioners: When to Use Them

5. Terraform State
    - Terraform State Command
    - Local and Remote State Storage
    - Demo: Persisting Terraform State in AWS S3

6. Terraform Modules
    - Accessing and Using Terraform Modules
    - Interacting with Terraform Module Inputs and Outputs
    - `DEMO` Building and Testing a Basic Terraform Module

7. Built-in Functions and Dynamic Blocks
    - Terraform Built-in Functions
    - Terraform Type Constraints (Collections & Structural)
    - Terraform Dynamic Blocks

8. Terraform CLI
    - Terraform fmt, taint, and import Commands
    - Terraform Workspaces
    - Debugging Terraform

9. Terraform Cloud and Enterprise
    - Benefits of Sentinel (Embedded Policy-as-Code Framework)
    - Best Practice: Terraform Vault Provider for Injecting Secrets Securely
    - Benefits of Terraform Registry and Terraform Cloud Workspaces
    - Differentiating Between Terraform OSS and Terraform Cloud Workspaces
    - Benefits of Terraform Cloud (Summary)

<br><br><br>


## 1. Introduction

### Exam Overview and Logistics

The HashiCorp Certified Terraform Associate exam evaluates foundational knowledge of Infrastructure as Code (IaC) and technical proficiency with Terraform.

* **Duration:** 1 hour.
* **Question Count:** 50–60 questions.
* **Format:** Online proctored via HashiCorp's official portal.
* **Version:** Tested on Terraform version 0.12 and higher. Note that versions prior to 0.12 have significant syntax and logic differences.
* **Validity:** Certification expires two years from the date of passing.

### Question Types

* **True/False:** Determine the accuracy of a statement.
* **Multiple Choice:** Select the single best answer from a list.
* **Multiple Answer:** Select two or more correct options from a list.
* **Text Match:** Fill-in-the-blank questions requiring typed answers. Variations of the correct term reflecting conceptual understanding are generally accepted.

<br><br><br>

## 2. Exam Objectives

The exam is structured around nine core objectives:

1. **IaC Concepts:** Understanding the definition and benefits of Infrastructure as Code.
2. **Terraform Purpose:** Differentiating Terraform from other IaC tools.
3. **Building Blocks:** Understanding providers, resources, and data blocks.
4. **Terraform CLI:** Executing commands and understanding best practices.
5. **Modules:** Creating reusable code, handling inputs/outputs, and versioning.
6. **Workflow:** Navigating the Terraform workflow and managing backend storage.
7. **State Management:** Implementing state tracking, locking, and handling sensitive data.
8. **HCL Coding:** Using variables, outputs, built-in functions, and dynamic blocks.
9. **Cloud & Enterprise:** Understanding Terraform Cloud/Enterprise features and Sentinel policy enforcement.

<br>

### Understanding Infrastructure As Code

IaC is the process of managing and provisioning IT systems through machine-readable definition files rather than manual interactive configuration.

### Benefits of IaC

* **Declarative:** Users define the "desired state" (what to deploy) rather than the "imperative" steps (how to deploy).
* **Version Control:** Code can be stored in systems like Git, providing visibility, audit trails, and collaboration.
* **Reduced Risk:** Minimized human intervention reduces "fat-finger" errors and security flaws.
* **Speed and Cost:** Faster deployments and consistent environments across different stages.
* **Documentation:** The code itself acts as documentation for the infrastructure.

<br>

### Terraform Core Features

Terraform is a cloud-agnostic tool used to codify infrastructure across various providers.

* **Resource Tracking:** Unlike some IaC tools, Terraform keeps track of all deployed resources via a state file.
* **Cloud-Agnostic:** Supports a wide library of providers including AWS, Azure, GCP, Alibaba, Kubernetes, and various databases (MySQL, InfluxDB).
* **State Management:** Automatically handles resource dependencies and updates. If a configuration is modified (e.g., a VM image change), Terraform manages the deletion of the old resource and creation of the new one to reach the desired state.
* **Software-Defined Networking (SDN):** Capable of codifying complex network configurations like VPCs.

<br>

### Sample Configuration (HCL)

Terraform uses HashiCorp Configuration Language (HCL), which is designed to be human-readable and declarative.

```hcl
# Define the Provider (AWS)
provider "aws" {
  region = "us-east-1"
}

# Define a Resource (Virtual Private Cloud)
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "MainVPC"
  }
}

```

#### Configuration Breakdown

* **Provider Block:** Specifies the cloud or infrastructure vendor.
* **Resource Block:** Defines a specific piece of infrastructure (e.g., a VPC).
* **Arguments:** Inputs provided to the resource, such as the `cidr_block` or `tags`.

<br><br><br>


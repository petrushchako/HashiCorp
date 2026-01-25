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


## Terraform Associate Certification Study Notes

This summary covers the foundational concepts, exam structure, and core benefits of Terraform as outlined in the introductory modules of the certification course.

---

### Exam Blueprint and Logistics

The HashiCorp Certified Terraform Associate exam validates foundational knowledge of Infrastructure as Code (IaC) and specific technical proficiency with Terraform.

* **Duration:** 1 hour.
* **Question Count:** 50–60 questions.
* **Version:** Tested on **version 1.0 or higher** (Note: Significant syntax changes occurred after v0.12).
* **Validity:** 2 years.
* **Format:** Online proctored.
* **Question Types:**
* **True/False:** Determine the accuracy of a statement.
* **Multiple Choice:** Select the single best answer.
* **Multiple Answer:** Select two or more correct options.
* **Text Match:** Fill-in-the-blank style questions (no choices provided).



#### Core Objectives

1. **IaC Concepts:** Benefits and advantages.
2. **Terraform Purpose:** Comparing Terraform to other IaC tools.
3. **Building Blocks:** Providers, resources, and data blocks.
4. **Terraform CLI:** Commands and best practices.
5. **Modules:** Reusability, inputs/outputs, and the Public Registry.
6. **Workflow:** Core workflow (Init, Plan, Apply, Destroy) and state management.
7. **State Management:** Remote backends, locking, and sensitive data.
8. **Configuration Syntax:** Variables, functions, and dynamic blocks.
9. **Cloud/Enterprise:** Sentinel (Policy as Code) and Workspace differences.

---

### Infrastructure as Code (IaC) Fundamentals

IaC is the process of managing and provisioning IT systems through machine-readable definition files rather than manual configuration.

* **Declarative Nature:** You define the **desired state** (what you want) rather than the step-by-step instructions (how to do it).
* **Version Control:** Code can be stored in Git, enabling team collaboration, auditing, and visibility.
* **Immutability:** Infrastructure is replaced rather than modified in place, reducing configuration drift.
* **Efficiency:** Reduces human error ("fat-fingering"), lowers costs, and increases deployment speed.

---

### Terraform Features and Benefits

Terraform distinguishes itself from configuration management tools (like Ansible or Chef) through several key features:

* **State Tracking:** Terraform maintains a state file to keep track of every resource deployed, allowing it to manage dependencies and updates effectively.
* **Cloud-Agnostic:** A single tool/language (HCL) can manage multiple providers (AWS, Azure, GCP, Alibaba, Kubernetes, MySQL, etc.).
* **Software-Defined Networking (SDN):** Easily codifies complex network topologies like VPCs and subnets.
* **High Availability:** Supports multi-cloud strategies to ensure service continuity across different vendors.

---

### Sample Configuration (HCL)

Terraform uses **HashiCorp Configuration Language (HCL)**. Below is a basic example of declaring a provider and a resource.

```hcl
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a Virtual Private Cloud (VPC)
resource "aws_vpc" "main_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Certification-Project"
  }
}

```

### Comparison of Question Types

| Type | Description |
| --- | --- |
| **True/False** | Validates conceptual accuracy. |
| **MCQ** | Tests specific knowledge or code snippet interpretation. |
| **Multiple Answer** | Requires comprehensive understanding of a feature's capabilities. |
| **Fill-in-the-blank** | Tests command-line or syntax recall (accepts minor variations). |


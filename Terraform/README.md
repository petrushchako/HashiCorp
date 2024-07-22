# HashiCorp Certified Terraform Associate

**CHAPTER 1**
- **Introduction**
    - Introduction
    - Exam Blueprint
    - Why Get Terraform Certified?

**CHAPTER 2**
- **Understanding Infrastructure As Code**
    - IaC and Its Benefits
    - Cloud Agnostic IaC with Terraform
    - Chapter Quiz: Understanding IaC

**CHAPTER 3**
- **IaC with Terraform**
    - What is the Terraform Workflow?
    - Terraform Init (Initializing the Working Directory)
    - Terraform Key Concepts: Plan, Apply, and Destroy
    - Resource Addressing in Terraform: Understanding Terraform Code
    - Deploying a VM in AWS Using the Terraform Workflow
    - Chapter Quiz: IaC with Terraform

**CHAPTER 4**
- **Terraform Fundamentals**
    - Installing Terraform and Terraform Providers
    - Terraform State: The Concept
    - Terraform Variables and Outputs
    - Terraform Provisioners: When to Use Them
    - Installing Terraform and Working with Terraform Providers
    - Using Terraform Provisioners to Set Up an Apache Web Server on AWS
    - Chapter Quiz: Terraform Fundamentals

**CHAPTER 5**
- **Terraform State**
    - Terraform State Command
    - Local and Remote State Storage
    - Demo: Persisting Terraform State in AWS S3
    - Exploring Terraform State Functionality
    - Chapter Quiz: Terraform State

**CHAPTER 6**
- **Terraform Modules**
    - Accessing and Using Terraform Modules
    - Interacting with Terraform Module Inputs and Outputs
    - Building and Testing a Basic Terraform Module
    - Chapter Quiz: Terraform Modules

**CHAPTER 7**
- **Built-in Functions and Dynamic Blocks**
    - Terraform Built-in Functions
    - Terraform Type Constraints (Collections & Structural)
    - Terraform Dynamic Blocks
    - Using Terraform Dynamic Blocks and Built-in Functions to Deploy to AWS
    - Chapter Quiz: Built-in Functions and Dynamic Blocks

**CHAPTER 8**
- **Terraform CLI**
    - Terraform fmt, taint, and import Commands
    - Terraform Workspaces
    - Debugging Terraform
    - Practicing Terraform CLI Commands (fmt, taint, and import)
    - Using Terraform CLI Commands (workspace and state) to Manipulate a Terraform Deployment
    - Chapter Quiz: Terraform CLI

**CHAPTER 9**
- **Terraform Cloud and Enterprise**
    - Section Intro
    - Benefits of Sentinel (Embedded Policy-as-Code Framework)
    - Best Practice: Terraform Vault Provider for Injecting Secrets Securely
    - Benefits of Terraform Registry and Terraform Cloud Workspaces
    - Differentiating Between Terraform OSS and Terraform Cloud Workspaces
    - Benefits of Terraform Cloud (Summary)
    - Section Summary
    - Chapter Quiz: Terraform Cloud and Enterprise

**CHAPTER 10**
- **Conclusion**
    - Wrapping It All Up - Summary





<br><hr><br>


## Chapter 2

### laC and Its Benefits
Infrastructure as Code (IaC) is a key DevOps practice that involves managing and provisioning computing infrastructure through machine-readable definition files, rather than through physical hardware configuration or interactive configuration tools. It allows for the automation of infrastructure setup, configuration, and management processes, leading to more efficient, consistent, and scalable operations.

#### Key Concepts of IaC

1. **Declarative vs. Imperative**:
   - **Declarative**: You define the desired state of your infrastructure, and the IaC tool (like Terraform) takes care of achieving that state. Terraform uses this approach.
   - **Imperative**: You write commands that specify the steps to achieve the desired state. Tools like Ansible can use this approach.

2. **Version Control**:
   - Treat infrastructure configurations as code that can be versioned and managed using version control systems like Git. This allows for tracking changes, collaborative development, and rollback capabilities.

3. **Idempotency**:
   - IaC ensures that applying the same configuration multiple times will produce the same result. This means you can safely reapply configurations without causing unintended changes or errors.

4. **Automation**:
   - IaC enables automation of the provisioning process, reducing the need for manual intervention and minimizing human errors. This leads to more reliable and repeatable infrastructure setups.

5. **Consistency**:
   - By using code to define infrastructure, you ensure that environments are consistent across different stages of development, testing, and production. This consistency reduces "configuration drift" and improves stability.

#### Benefits of IaC

- **Speed and Efficiency**: Automating infrastructure setup and management accelerates deployment times and improves operational efficiency.
- **Scalability**: IaC makes it easier to scale infrastructure up or down by simply modifying the configuration code.
- **Reproducibility**: Environments can be reproduced reliably and consistently, which is crucial for development, testing, and production.
- **Collaboration**: Teams can collaborate on infrastructure code using version control, making it easier to review, discuss, and approve changes.
- **Documentation**: IaC code serves as documentation for your infrastructure setup, making it easier to understand and manage.

#### Popular IaC Tools

- **Terraform**: A tool by HashiCorp that uses a declarative approach to define and provision infrastructure across various cloud providers.
- **CloudFormation**: An AWS service for defining and managing infrastructure using JSON or YAML templates.
- **Ansible**: A configuration management tool that can also be used for IaC with its playbooks.
- **Puppet**: A configuration management tool that uses a declarative language to define infrastructure configurations.
- **Chef**: A configuration management tool that uses Ruby-based DSL for defining infrastructure as code.

#### Example of Terraform IaC Code

Here’s a simple example of a Terraform configuration to create an AWS EC2 instance:

```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
```

In this example:
- The `provider` block specifies the AWS region.
- The `resource` block defines an AWS EC2 instance with a specific AMI and instance type.



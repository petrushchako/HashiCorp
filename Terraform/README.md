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


## Chapter 2<br>Understanding Infrastructure As Code

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


<br>

### Cloud Agnostic IaC with Terraform

**Overview**:
Terraform is a powerful tool for codifying configurations for software-defined networks (SDNs) and infrastructure deployments, enabling DevOps and cloud-agnostic operations.

**Key Features of Terraform**:

1. **Software-Defined Networks (SDNs)**:
   - Terraform allows the configuration of SDNs, such as AWS Virtual Private Cloud (VPC), using HashiCorp Configuration Language (HCL).
   - Enables developers to manage networks as code, integrating seamlessly into DevOps workflows.

2. **Versatility and Uniformity**:
   - Terraform interfaces with various cloud and infrastructure vendor APIs, as well as resource schedulers like Kubernetes.
   - Uses a uniform language (HCL) across different platforms, providing a consistent user experience regardless of the deployment environment.

3. **Cloud Agnostic**:
   - Terraform supports a wide range of cloud and infrastructure vendors, making it agnostic to specific cloud providers.
   - Facilitates high availability solutions across multiple public clouds (e.g., AWS and GCP) beyond the capabilities of a single vendor.

4. **Provider Ecosystem**:
   - Extensive and growing library of providers for major public clouds (AWS, Azure, Alibaba, VMware, Oracle) and other services (DigitalOcean, Fastly, Gridscale, Heroku).
   - Includes providers for databases (MySQL, InfluxDB) and more, showcasing the active community and broad interfacing capabilities.

5. **State Management**:
   - Terraform’s state tracking mechanism centralizes dependency and resource tracking.
   - Simplifies infrastructure changes by handling modifications automatically to achieve the desired state.
   - Example: Changing the OS image of a cloud VM is managed by Terraform, which handles the deletion of the old VM and provisioning of the new one, reducing manual effort and errors.

**Benefits of Using Terraform**:
- Automates infrastructure provisioning and management, saving time and reducing human error.
- Promotes high availability and disaster recovery through multi-cloud deployments.
- Supports a diverse and expanding range of cloud services and providers.
- Ensures consistent and repeatable infrastructure setups with its declarative approach.



<br>

#### How Terraform Achieves Cloud Agnosticity

Terraform achieves cloud agnosticity by interfacing with the APIs of various cloud providers and infrastructure tools. This design enables users to write a single, uniform configuration in HashiCorp Configuration Language (HCL) to manage resources across multiple clouds. The core components that facilitate this capability are:

1. **Providers**:
   - Providers are plugins that enable Terraform to interact with different cloud platforms and services. Each provider is responsible for understanding the API of the service it manages.
   - For example, the AWS provider knows how to create, update, and delete AWS resources by making appropriate API calls to AWS services. Similarly, the Azure provider interacts with Azure APIs, and so on.

2. **Provider Plugins**:
   - Each provider plugin translates Terraform’s declarative configuration into API calls specific to the cloud provider or tool it supports.
   - This abstraction layer allows users to define infrastructure resources in a consistent manner, regardless of the underlying platform.

3. **Unified Configuration Language (HCL)**:
   - Terraform’s HCL allows users to define infrastructure resources in a consistent, human-readable format.
   - The same HCL code can be used to describe resources for different providers, making the configuration portable across different environments.

4. **State Management**:
   - Terraform maintains a state file that tracks the current state of the managed infrastructure. This state file is essential for mapping the declared resources in HCL to the actual resources in the cloud provider.
   - The state management system helps Terraform understand the existing infrastructure and apply changes incrementally, regardless of the provider.

#### Example

A simple example of a Terraform configuration that is cloud-agnostic might look like this:

```hcl
provider "aws" {
  region = "us-west-2"
}

provider "google" {
  project = "my-project"
  region  = "us-west1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "f1-micro"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
  }
}
```

In this configuration:
- The `provider "aws"` block sets up the AWS provider.
- The `provider "google"` block sets up the Google Cloud provider.
- The `resource "aws_instance" "example"` block defines an AWS EC2 instance.
- The `resource "google_compute_instance" "example"` block defines a Google Compute Engine instance.

Despite the differences in cloud providers, the configuration syntax remains consistent, and Terraform handles the underlying API interactions specific to each provider.

#### Conclusion

Terraform’s cloud-agnostic approach is made possible by its use of provider plugins that interact with cloud provider APIs. This design allows users to define infrastructure as code in a consistent manner, making it easier to manage multi-cloud environments and achieve high availability and flexibility.






<br><br>


## Chapter 3 <br>IaC with Terraform
### Terraform Workflow

#### Overview
The Terraform workflow involves three primary phases: writing code, reviewing changes, and executing the code to deploy infrastructure. This structured approach ensures efficient and reliable infrastructure management.

#### Workflow Phases

1. **Write Phase**:
   - **Objective**: Develop the initial Terraform configuration.
   - **Best Practices**:
     - **Version Control**: Use a version control system (e.g., Git) to manage your Terraform code. This facilitates collaboration and iterative improvements.
     - **Flat Files**: For individual work, you might start with flat files, but version control is still recommended for tracking changes.

2. **Plan Phase**:
   - **Objective**: Review the changes that the Terraform configuration will make.
   - **Details**:
     - Run the `terraform plan` command to see a detailed preview of the changes Terraform will apply.
     - This step allows you to verify the planned changes and ensure they align with your expectations.
     - Modify the code based on the plan output to perfect your configuration.

3. **Apply Phase**:
   - **Objective**: Execute the Terraform configuration to deploy infrastructure.
   - **Details**:
     - Run the `terraform apply` command to apply the changes and create real resources in the cloud.
     - This step makes actual changes to the environment, deploying the specified infrastructure.

#### Workflow Summary
- **Write**: Develop Terraform configurations using best practices such as version control.
- **Plan**: Preview and review the changes to be made by Terraform without deploying them.
- **Apply**: Execute the configuration to create and manage infrastructure.

#### Example Workflow

1. **Write Code**:
   - Develop Terraform configuration files (`*.tf`).

   ```hcl
   provider "aws" {
     region = "us-west-2"
   }

   resource "aws_instance" "example" {
     ami           = "ami-0c55b159cbfafe1f0"
     instance_type = "t2.micro"
   }
   ```

2. **Plan Changes**:
   - Run `terraform plan` to see the planned changes.

   ```shell
   $ terraform plan
   ```

   - Review the output to understand what resources will be created, modified, or destroyed.

3. **Apply Changes**:
   - Run `terraform apply` to apply the configuration.

   ```shell
   $ terraform apply
   ```

   - Confirm the apply action to deploy the infrastructure.





<br>

### Terraform Init (Initializing the Working Directory)

#### Overview

`terraform init` is a fundamental command in the Terraform workflow. It initializes the working directory containing your Terraform configuration files, preparing it for use by downloading necessary components and setting up the backend.

#### Key Functions of `terraform init`

1. **Downloading Providers**:
   - Providers are plugins that enable Terraform to interact with various cloud services and APIs. `terraform init` downloads the providers specified in your configuration, ensuring the necessary libraries and code are available for your resources to make API calls.

2. **Fetching Modules**:
   - Modules are reusable configurations that can be called within your Terraform code. `terraform init` retrieves these modules from the Terraform Registry or custom URLs, caching them locally for use in your project.

3. **Setting Up Backend**:
   - The backend is a configuration that specifies where Terraform's state data is stored. `terraform init` sets up this backend, which is crucial for tracking the state of your resources. The state file allows Terraform to manage resource creation, updates, and deletions.

#### Workflow

1. **Command Execution**:
   - Run `terraform init` in the directory containing your Terraform configuration files.

   ```shell
   $ terraform init
   ```

2. **Provider and Module Initialization**:
   - `terraform init` checks for the providers and modules specified in your configuration files.
   - It downloads these components from the Terraform Registry or custom URLs, caching them locally.
   - If a newer version of a module or provider is available, `terraform init` will download and install the latest version by default.

3. **Backend Configuration**:
   - Configures the backend for storing the Terraform state file, which is essential for resource management.

#### Example

Consider the following Terraform configuration that specifies an AWS provider and a module:

```hcl
provider "aws" {
  region = "us-west-2"
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "2.0.0"

  bucket = "my-tf-test-bucket"
  acl    = "private"
}
```

Running `terraform init` in the directory with this configuration file will:

- Download the AWS provider plugin.
- Fetch the `s3-bucket` module from the Terraform Registry.
- Set up the local backend for state management.

```shell
$ terraform init
```

#### Additional Functionality

`terraform init` supports several flags and options to customize its behavior. Some of the useful options include:

- `-backend-config`: Specifies additional backend configuration settings.
- `-from-module`: Clones an existing Terraform configuration from a module source.
- `-upgrade`: Upgrades modules and providers to the latest version.

#### Conclusion

`terraform init` is a critical step in the Terraform workflow, preparing your working directory by downloading necessary providers and modules, and configuring the backend for state management. It ensures that your Terraform environment is ready for further actions, such as planning and applying configurations. Understanding and properly utilizing `terraform init` is essential for effective Terraform project management.




<br>


### Terraform Key Concepts: Plan, Apply and Destroy


#### Overview

Terraform's core workflow revolves around three key commands: `plan`, `apply`, and `destroy`. These commands are essential for managing the lifecycle of infrastructure as code (IaC) using Terraform.

#### Terraform Core Workflow

![](img/plan-apply-destroy.png)

1. **Write Phase**:
   - Develop the initial Terraform configuration code.

2. **Plan Phase**:
   - Use `terraform plan` to review the changes that the code will make.
   - Iterate between writing and planning to refine and perfect the configuration.

3. **Apply Phase**:
   - Execute the code with `terraform apply` to deploy the actual infrastructure.

#### Key Commands

1. **terraform plan**

   **Description**:
   - Generates an execution plan, showing what actions Terraform will take to achieve the desired state defined in the configuration files.
   - This command is read-only and makes no changes to the actual environment.

   **Functionality**:
   - Validates the configuration and prepares the execution plan.
   - Authenticates with the credentials of the target platform.
   - Allows users to review the planned actions before any resources are created, modified, or destroyed.

   **Usage**:
   ```shell
   $ terraform plan
   ```

   **Benefits**:
   - Enables both individuals and teams to review and vet the planned changes.
   - Helps identify and prevent unforeseen resource deployments.

2. **terraform apply**

   **Description**:
   - Executes the actions proposed in the plan, applying the configuration to deploy infrastructure.

   **Functionality**:
   - Creates, updates, and deletes resources as specified in the Terraform configuration.
   - Updates the Terraform state file (`terraform.tfstate`), which tracks the current state of the managed infrastructure.

   **Usage**:
   ```shell
   $ terraform apply
   ```

   **State File**:
   - Essential for Terraform's operation, the state file records the details of resources created and is referenced in subsequent operations.
   - Can be stored locally or remotely, with the default name `terraform.tfstate`.

3. **terraform destroy**

   **Description**:
   - Destroys the infrastructure managed by Terraform, as defined in the state file.

   **Functionality**:
   - Reads the state file and removes all tracked resources.
   - Should be used with caution, as it is irreversible.

   **Usage**:
   ```shell
   $ terraform destroy
   ```

   **Benefits**:
   - Simplifies cleanup of resources, ensuring uniform deletion of infrastructure.
   - Saves time by eliminating the need for custom scripts to remove resources.

#### Summary

- **terraform plan**: Reviews the code and shows the planned changes.
- **terraform apply**: Deploys and manages the infrastructure, updating the state file.
- **terraform destroy**: Cleans up and deletes all tracked resources.

These commands align with the Terraform core workflow and are crucial for effective infrastructure management. To reinforce these concepts, a hands-on lab is available at the end of this section.

### Hands-on Lab

To practice these commands and understand the Terraform workflow better, be sure to complete the hands-on lab provided at the end of this section. This will give you practical experience in using `terraform plan`, `terraform apply`, and `terraform destroy`.





<br>


### Resource Addressing in Terraform and Understanding Terraform Code

#### Overview

This lesson introduces the fundamental concepts of Terraform code, focusing on resource addressing. We'll explore provider blocks, resource blocks, and data source blocks, which are essential for defining and managing infrastructure with Terraform.

#### Provider Block

A provider block configures the necessary providers for Terraform to interact with different cloud platforms. Providers abstract away the API calls under the hood.

##### Example: AWS Provider

```hcl
provider "aws" {
  region = "us-west-2"
}
```

- **Keyword**: `provider`
- **Provider Name**: `aws`
- **Configuration Parameters**: Arguments for the AWS provider, such as `region`.

##### Example: GCP Provider

```hcl
provider "google" {
  credentials = file("path/to/credentials.json")
  project     = "my-gcp-project"
  region      = "us-central1"
}
```

- **Keyword**: `provider`
- **Provider Name**: `google`
- **Configuration Parameters**:
  - `credentials`: Path to the authentication credentials file.
  - `project`: GCP project ID.
  - `region`: GCP region.

#### Resource Block

A resource block defines a resource that Terraform will create and manage. Each resource is associated with a provider.

##### Example: AWS EC2 Instance

```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

- **Keyword**: `resource`
- **Resource Type**: `aws_instance`
- **Resource Name**: `web`
- **Configuration Arguments**:
  - `ami`: Amazon Machine Image ID.
  - `instance_type`: EC2 instance type.

**Accessing Resource Attributes**:

To access attributes of the resource within Terraform code:

```hcl
aws_instance.web.id
```

#### Data Source Block

A data source block fetches data from existing resources, allowing you to reference and use this information in your Terraform configuration.

##### Example: AWS EC2 Instance Data Source

```hcl
data "aws_instance" "my-vm" {
  instance_id = "i-0abcdef1234567890"
}
```

- **Keyword**: `data`
- **Resource Type**: `aws_instance`
- **Resource Name**: `my-vm`
- **Configuration Arguments**:
  - `instance_id`: ID of the existing EC2 instance.

**Accessing Data Source Attributes**:

To access attributes of the data source within Terraform code:

```hcl
data.aws_instance.my-vm.id
```

#### Default Behaviors and Best Practices

- **File Extensions**: Terraform executes code in files ending with `.tf`. Ensure your Terraform code is saved with this extension.
- **Provider Registry**: By default, Terraform sources providers from the [Terraform Registry](https://registry.terraform.io/). Providers can also be sourced locally or from custom locations.
- **Custom Providers**: Terraform supports custom providers, allowing for flexibility in managing infrastructure beyond the default providers.

#### Summary

- **Provider Block**: Configures the necessary providers for interacting with cloud platforms.
- **Resource Block**: Defines resources to be created and managed by Terraform.
- **Data Source Block**: Fetches data from existing resources for reference within Terraform configurations.


<br><br>

## Chapter 4 <br>Terraform Fundamentals
### Installing Terraform and Terraform Providers

https://developer.hashicorp.com/terraform/install

There are 2 methods to install Terraform:
1. Download, Unzip, Use
   1. Download Zipped Binary from Hashicorp Website
   2. Unzip Terraform Binary
   3. As a best practice, place it in your system's `$PATH`
2. Set up Terraform repository on Linux (only)
   1. Set up a Hashicorp Terraform Repository on Linux (Debian, RHEL, Amazon Linux)
   2. Use package manager to install Terraform
   3. Package manager installs and sets it up so that it is ready to use.

    ```sh
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    sudo yum -y install terraform
    ```


<br>

#### macOS installation
```sh
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```


<br>

#### Terraform Providers
- Providers are Terraform's way of abstracting integrations with API control layer of the infrastructure vendors.
- Terraform, by default, looks for Providers in the Terraform providers registry. <br>https://registry.terraform.io/browse/providers
- Providers are plugins. They are released on a separate rhythm from Terraform itself, and each provider has its own series of version numbers.
- You can write your own custom providers as well! (Beyond scope of certification)
- Terraform finds and installs providers when initializing working directory(via terraform init).
- As a best practice Providers should be pegged down to a specific version, SO that any changes across provider version doesn't break your Terraform code.
    ```hcl
    provider "azurerm" {
        version = "2.20.0"
        features {}
    }

    providers "aws" {
        version = "3.7.0"
        region = "us-east-1"
    }
    ```




<br>


### Terraform State: The Concept

#### Introduction

Terraform state is a fundamental component that enables Terraform to manage infrastructure effectively. Without it, Terraform would not function. This lesson explains the importance of state, its working mechanism, and best practices for managing state files.

#### Importance of Terraform State

**Resource Tracking**: Terraform state is crucial for tracking resources. It allows Terraform to:

1. **Identify Deployed Resources**: Track what has been deployed.
2. **Decision Making**: Determine whether resources need to be created, modified, or destroyed.

#### How Terraform State Works

1. **State File**:
    - A JSON file that maps resources defined in the Terraform configuration to the actual resources in the managed infrastructure.
    - Contains metadata and details about all deployed resources.

2. **State File Utilization**:
    - **Deletion**: When issuing the `terraform destroy` command, Terraform references the state file to identify and delete resources.
    - **Delta Calculation**: Terraform compares the current state (as defined in the state file) with the desired state (as defined in the configuration code) to calculate changes (deltas) and reconcile the infrastructure accordingly.

#### Storing Terraform State

1. **Local Storage**:
    - By default, the state file is stored locally in the same directory as the Terraform code.

2. **Remote Storage**:
    - For better integrity and availability, state files can also be stored remotely using supported backend services like AWS S3, Azure Blob Storage, Google Cloud Storage, etc.

#### Security and Integrity of State Files

1. **Never Lose the State File**:
    - Losing the state file means losing the ability to manage and modify the infrastructure through Terraform, making manual changes cumbersome and error-prone.

2. **Protect the State File**:
    - Ensure the state file does not fall into the wrong hands, as it may contain sensitive information about the deployed resources.

#### Summary

- **Terraform State**: A JSON file that tracks resources and enables Terraform to manage infrastructure.
- **Resource Tracking**: Critical for identifying and managing deployed resources.
- **State File**: Contains metadata and details of resources, helping Terraform calculate and apply changes.
- **Storage**: Can be stored locally or remotely for better availability.
- **Security**: Protect and secure the state file to avoid loss of management capabilities and exposure of sensitive data.


<br>

### Terraform Variables and Outputs

#### Variables in Terraform
##### Initialization
- ![](img/terraformVariable.png)
- Variable declaration snippet
    ```hcl
    variable "my-var" {
        description = "My Test Variable"
        type        = string
        default     = "Hello"
    }
    ```
- All the options within `{}` are optional, so you can declare variable as following: `variable "my-var" {}`. <br>However, in this case you will have to provide value for this variable either through an OS environment variable or a command line input to avoid runtime error. 

##### Referencing
- To use the variable within your configuration you will have to follow format below:
    ```hcl
    var.my-var
    ```
- You can create variables from the main `tf` file, however it is recomended to gather all variables in a separate file `terraform.tfvars` that is picked up by terraform by default.
  

##### Variable validation (available from version 0.13)
- Variable validation allows you to set a criteria for allowed values for a variable:
    ```hcl
    variable "my-var" {
        description = "My Test Variable"
        type        = string
        default     = "Hello"
        validation {
            condition       = length(var.my-var) > 4
            error_message   = "The length must be more than 4 characters"
        }
    }
    ```

##### Sensitive variables
- You can enable a config parameter known as sensitive to prevent Terraform from showing its value during Terraform execution runs, which is the default behavior within Terraform.
    ```hcl
    variable "my-var" {
        description = "My Test Variable"
        type        = string
        default     = "Hello"
        sensitive   = true
    }
    ```


#### Variable Types and Constraints

Terraform supports various types of variables that you can use to parameterize your configurations. These variable types fall into two categories: base types and complex types.

### Base Types

- **`string`**: Represents a sequence of characters.
    ```hcl
    variable "my-string" {
        type    = string
        default = "Hello"
    }
    ```

- **`number`**: Represents numeric values.
    ```hcl
    variable "my-number" {
        type    = number
        default = 42
    }
    ```

- **`bool`**: Represents boolean values (`true` or `false`).
    ```hcl
    variable "my-bool" {
        type    = bool
        default = true
    }
    ```

### Complex Types

- **`list`**: Represents a sequence of values, all of the same type.
    ```hcl
    variable "av-zone-name" {
        type    = list(string)
        default = ["us-west-1a"]
    }
    ```

- **`set`**: Represents a collection of unique values, all of the same type.
    ```hcl
    variable "allowed-ips" {
        type = set(string)
        default = ["192.168.1.1", "192.168.1.2"]
    }
    ```

- **`map`**: Represents a collection of key-value pairs.
    ```hcl
    variable "region-mapping" {
        type = map(string)
        default = {
            "us-east-1" = "US East (N. Virginia)"
            "us-west-1" = "US West (N. California)"
        }
    }
    ```

- **`object`**: Represents a collection of named attributes that each have their own type.
    ```hcl
    variable "docker-ports" {
        type = list(object({
            internal = number
            external = number
            protocol = string
        }))
        default = [
            {
                internal = 8300
                external = 8300
                protocol = "tcp"
            }
        ]
    }
    ```

- **`tuple`**: Represents a sequence of values, where each element has its own type.
    ```hcl
    variable "example-tuple" {
        type = tuple([string, number, bool])
        default = ["example", 123, true]
    }
    ```

<br>

#### Terraform Output - Output Values

Output values in Terraform serve as a way to extract information from your configuration and display it back to the user or use it in other configurations or scripts. Here's a detailed breakdown:

- **Display on CLI**: After a successful `terraform apply` or other execution commands, output values are shown in the terminal. This helps users get immediate feedback about the deployed resources.
  
- **Track and Use Values**: Output values act like return values. They allow you to track and display specific details about your deployed resources, such as IP addresses, resource IDs, or other pertinent information.

##### Example Usage

```hcl
output "instance-ip" {
    description = "VM's Private IP"
    value       = aws_instance.my-vm.private_ip
}
```

In this example, the `output` block named `instance-ip` captures and displays the private IP address of an AWS instance resource named `my-vm`. 

- **description**: (Optional) A human-readable description of what the output value represents.
- **value**: (Mandatory) The value to be returned. This can reference any attribute of the resources defined in your Terraform configuration.

##### Example Configuration with Outputs

Here’s an example of a Terraform configuration with resources and outputs:

```hcl
provider "aws" {
    region = "us-west-1"
}

resource "aws_instance" "my-vm" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
}

output "instance-id" {
    description = "ID of the EC2 instance"
    value       = aws_instance.my-vm.id
}

output "instance-ip" {
    description = "Private IP of the EC2 instance"
    value       = aws_instance.my-vm.private_ip
}
```

In this example:

- An AWS EC2 instance is created using the `aws_instance` resource.
- Two outputs are defined:
  - `instance-id`: Captures and displays the EC2 instance ID.
  - `instance-ip`: Captures and displays the EC2 instance's private IP address.

##### Best Practices

- **Naming**: Use descriptive names for your outputs to make it clear what each output value represents.
- **Security**: Be cautious with sensitive information. Avoid exposing sensitive details through outputs that might be displayed in logs or the CLI.
- **Usage in Modules**: Outputs can be particularly useful when using modules, as they allow you to expose and pass necessary information between different parts of your configuration.

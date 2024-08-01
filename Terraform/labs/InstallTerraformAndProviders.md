# Installing Terraform and Working With Terraform Providers

### Introduction
In this hands-on lab, we'll go through installing and configuring Terraform version 13 on a Linux OS. We will also explore how to select and use a Terraform provider from among the many providers available publicly.

## Solution
### Download And Manually Install the Terraform Binary

1. Download the appropriate Terraform binary package for the provided lab server VM (Linux 64-bit) using the wget command:

  `wget -c https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip`

2. Unzip the downloaded file:

  `unzip terraform_0.13.4_linux_amd64.zip`

3. Place the Terraform binary in the `PATH` of the VM operating system so the binary is accessible system-wide to all users:

  `sudo mv terraform /usr/sbin/`

  > Note: If prompted, enter the username and password.

4. Check the Terraform version information:

  `terraform version`

  Since the Terraform version is returned, you have validated that the Terraform binary is installed and working properly.


<br><br>

### Clone Over Code for Terraform Providers

1. Create a `providers` directory:

  `mkdir providers`

2. Move into the providers directory:

  `cd providers/`

3. Create the file `main.tf`:

  `vim main.tf`

4. Paste in the following code from the provided GitHub repo:

    ```hcl
    provider "aws" {
    alias  = "us-east-1"
    region = "us-east-1"
    }

    provider "aws" {
    alias  = "us-west-2"
    region = "us-west-2"
    }

    resource "aws_sns_topic" "topic-us-east" {
    provider = aws.us-east-1
    name     = "topic-us-east"
    }

    resource "aws_sns_topic" "topic-us-west" {
    provider = aws.us-west-2
    name     = "topic-us-west"
    }
    ```

5. To save and exit the file, press Escape and enter :wq.


<br><br>

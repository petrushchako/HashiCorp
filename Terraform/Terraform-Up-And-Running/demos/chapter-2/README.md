# Chapter 2: Getting Started with Terraform

### Install Terraform

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

Verify installation by running 
```sh
terraform
```

<br>

### AWS credential setup

```sh
export AWS_ACCESS_KEY_ID=<your access key>
export AWS_SECRET_ACCESS_KEY=<your secret access key>
```

## Terraform Workflow

```sh
# Initialize provider
# e.g. download aws provider binaries
terraform init

# Plan the steps
terraform plan

# Apply the configuration with auto approval
terraform apply -auto-approve
```

### Working with variables
We have defined a `variables.tf` file with set of values that will be used in `main.tf`. You can also use the `-var 'foo=bar'` or `-var-file=filename`. However, in single-server example, the `variables.tf` file is automatically loaded (since it has `.tf` extension, and contains a default values for each variable. 


### Testing single-server deployment
The output is used in single-server example to output the public IP of the server created. However you can use following command to review the output in later stages:

```sh
terraform output
# Or more specific
terraform output public_ip
```

Use `curl request to test the server

```sh
alex single-server (main) >> curl 108.130.123.17:8080
Hello from Terraform EC2 via Python
```

### Cleanup
Run the `terraform destroy` command to cleanup the infrastructure created.

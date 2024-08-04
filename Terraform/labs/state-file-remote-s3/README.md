# AWS S3 setup for lab


1. Create profile
    
```sh
aws --profile demo configure
```

<br>

2. Create S3 bucket

```sh
aws - -profile demo s3api create-bucket - -bucket myawesomes3bucket 3344
# Success message
# {
#     "Location": "/myawesomes3bucket33444"   
# }
```

<br>

3. After running terraform init/plan/apply you can extract terraform state file from the bucket using following command:

```sh
# Veriafy file exists
aws --profile demo $3 ls s3://myawesomes3bucket3344/terraform.tfstate
# Copy file to local storage
aws --profile demo $3 ls s3://myawesomes3bucket3344/terraform.tfstate .
```

<br><br>

<hr>

- You can pass variable values via CLI:

    `terraform apply -var external_port=8181`

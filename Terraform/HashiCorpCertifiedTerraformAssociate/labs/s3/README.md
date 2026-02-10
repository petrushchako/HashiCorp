# AWS S3 bucket creation


### Verify installation

```sh
aws s3api list-buckets --output table

------------------------------------------------------------------------------
|                                 ListBuckets                                |
+-----------------------------------------+----------------------------------+
|  Prefix                                 |  None                            |
+-----------------------------------------+----------------------------------+
||                                  Buckets                                 ||
|+----------------+---------------------------------------------------------+|
||  BucketArn     |  arn:aws:s3:::my-unique-bucket-coherent-panther         ||
||  CreationDate  |  2026-02-10T23:25:33+00:00                              ||
||  Name          |  my-unique-bucket-coherent-panther                      ||
|+----------------+---------------------------------------------------------+|
||                                   Owner                                  ||
|+----+---------------------------------------------------------------------+|
```


### Generate random name for S3 bucket
Use `random_pet` resource to create random name

```hcl
resource "random_pet" "server_name" {
  length    = 2      # Number of words (e.g., "happy-otter")
  separator = "-"    # Character between words
}
```

| **Attribute** | **Description**                                                                |
|---------------|--------------------------------------------------------------------------------|
| `length`      | The number of words in the name (default is 2).                                |
| `prefix`      | A static string added to the beginning (e.g., prod-).                          |
| `separator`   | The character used to join words (default is -).                               |
| `keepers`     | A map of values that, if changed, will force Terraform to generate a new name. |


> By default, once Terraform generates a pet name, it saves it in the terraform.tfstate file and never changes it unless you delete the resource.
> 
> If you want the name to change only when something specific happens (like changing the AWS Region), you use keepers:
>
> ```hcl
>  resource "random_pet" "bucket_suffix" {
>   keepers = {
>     # If the region changes, generate a brand new pet name
>    region = var.aws_region 
>   }
> }
> ```
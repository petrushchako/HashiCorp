# Create EC2 instnace

Use CLI tool to find the AMI version

```sh
aws ec2 describe-images --owners amazon --filters Name=name,Values=al2023-ami-kernel-default-x86_64 --query 'sort_by(Images, &CreationDate)[-1].ImageId' --output text
```

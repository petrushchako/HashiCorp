terraform {
  backend "s3' {
    region = "us-east-1"
    key = "terraformstatefile"
    bucket = "myawesomes3bucket3344"
    }
}

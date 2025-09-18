# Terraform configuration to create an AWS S3 bucket

provider "aws" {
  region = "us-west-2"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-name-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "My S3 Bucket"
    Environment = "Dev"
  }
}

# Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

# Output the bucket ARN
output "bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}
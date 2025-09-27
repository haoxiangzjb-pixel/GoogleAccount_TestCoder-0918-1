terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# S3 Bucket Name as a Variable
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

# AWS S3 Bucket Resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

# Output the bucket domain name
output "bucket_domain_name" {
  value = aws_s3_bucket.my_bucket.bucket_domain_name
}
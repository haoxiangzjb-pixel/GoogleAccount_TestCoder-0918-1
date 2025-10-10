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

# Define an input variable for the bucket name
variable "bucket_name" {
  description = "The name of the S3 bucket to create"
  type        = string
}

# Define an input variable for the AWS region
variable "aws_region" {
  description = "The AWS region to deploy the bucket in"
  type        = string
  default     = "us-east-1"
}

# Create the S3 bucket resource
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

# Output the bucket name and region
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}

output "bucket_region" {
  value = aws_s3_bucket.my_bucket.region
}
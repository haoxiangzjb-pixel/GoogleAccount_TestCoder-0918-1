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

# Variable for the S3 bucket name
variable "bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy the bucket in"
  type        = string
  default     = "us-west-2"
}

# Resource: S3 Bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name
}

# Output the bucket name and ARN
output "bucket_name" {
  value = aws_s3_bucket.example_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.example_bucket.arn
}
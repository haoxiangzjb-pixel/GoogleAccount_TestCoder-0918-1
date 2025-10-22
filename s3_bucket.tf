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

# Variable definitions
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Create S3 bucket
resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name
}

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "example_bucket_versioning" {
  bucket = aws_s3_bucket.example_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Output the bucket name and ARN
output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.example_bucket.bucket
}

output "bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = aws_s3_bucket.example_bucket.arn
}
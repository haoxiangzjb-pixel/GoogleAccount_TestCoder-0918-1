variable "instance_type" {
  description = "The EC2 instance type to use"
  type        = string
  default     = "t3.micro"
  
  validation {
    condition     = length(var.instance_type) > 0
    error_message = "Instance type must not be empty."
  }
}
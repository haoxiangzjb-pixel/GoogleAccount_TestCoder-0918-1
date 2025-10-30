# Define a variable for the public IP (in real scenarios, this would come from a resource)
variable "public_ip" {
  description = "Public IP address"
  type        = string
  default     = "203.0.113.1"  # Example IP
}

# Define output for the public IP
output "public_ip_address" {
  value = var.public_ip
  description = "The public IP address"
}

# Create a null resource to handle saving the IP to a file with random name
resource "null_resource" "save_ip" {
  triggers = {
    always_run = "${timestamp()}"
  }

  # Provisioner to save the public IP to a file with random name
  provisioner "local-exec" {
    command = <<EOT
      # Generate a random filename
      random_filename="public_ip_$(date +%s)_$RANDOM.txt"
      
      # Save the public IP to the file
      echo "${var.public_ip}" > "$random_filename"
      
      echo "Public IP saved to file: $random_filename"
    EOT
  }
}
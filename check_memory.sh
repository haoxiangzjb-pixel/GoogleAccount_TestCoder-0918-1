#!/bin/bash

# Script to check system memory usage and save it to a randomly named .sh file

# Get memory usage information
memory_info=$(free -h)

# Generate a random filename
random_filename=$(mktemp --suffix=.sh)

# Save the memory information to the random file
echo "$memory_info" > "$random_filename"

# Make the generated script executable
chmod +x "$random_filename"

echo "Memory usage information saved to: $random_filename"
echo "$memory_info"
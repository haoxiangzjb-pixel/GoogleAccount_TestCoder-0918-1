#!/bin/bash

# Script to check system memory usage and save the output to a file with a random name

# Generate a random filename
random_filename=$(mktemp --suffix=.txt)

# Get memory usage information using the 'free' command and save it to the random file
free -h > "$random_filename"

# Display the name of the file where the memory usage was saved
echo "Memory usage information saved to: $random_filename"

# Optional: Display the content of the file
cat "$random_filename"
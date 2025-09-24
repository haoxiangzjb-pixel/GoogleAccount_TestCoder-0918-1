#!/bin/bash

# Script to check system memory usage and save the output to a file with a random name.

# Generate a random filename using the date and some random characters
random_filename="memory_usage_$(date +%s%N).txt"

# Get the memory usage information using the 'free' command and save it to the random file
free -h > "$random_filename"

echo "Memory usage information saved to $random_filename"
cat "$random_filename"

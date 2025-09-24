#!/bin/bash

# Script to check system memory usage and save the report to a file

# Get the current date and time for the filename
DATE=$(date +"%Y%m%d_%H%M%S")

# Define the output file name with a random component
OUTPUT_FILE="/workspace/memory_report_${DATE}.txt"

# Use the 'free' command to get memory usage and save it to the output file
free -h > "$OUTPUT_FILE"

# Also append the output of 'vmstat' for additional memory statistics
echo -e "\nVirtual Memory Statistics:" >> "$OUTPUT_FILE"
vmstat >> "$OUTPUT_FILE"

# Print a confirmation message
echo "Memory usage report saved to $OUTPUT_FILE"

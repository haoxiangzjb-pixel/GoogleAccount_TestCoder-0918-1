#!/bin/bash

# Script to check system memory usage and save the report to a file with a random name.

# Generate a random filename for the report
REPORT_FILE="/workspace/memory_usage_report_$(date +%s).txt"

# Get memory usage information using the 'free' command and save it to the report file
free -h > "$REPORT_FILE"

# Append additional memory details from /proc/meminfo
echo -e "\nDetailed Memory Information from /proc/meminfo:\n" >> "$REPORT_FILE"
cat /proc/meminfo >> "$REPORT_FILE"

# Print a confirmation message
echo "Memory usage report saved to: $REPORT_FILE"

# Display the first few lines of the generated report
head -n 20 "$REPORT_FILE"
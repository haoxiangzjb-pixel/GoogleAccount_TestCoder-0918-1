#!/bin/bash

echo "-------------------------------------------"
echo "Memory Usage Report - $(date)"
echo "-------------------------------------------"

# Get total, used, and free memory in MB
total_mem=$(free -m | awk 'NR==2{print $2}')
used_mem=$(free -m | awk 'NR==2{print $3}')
free_mem=$(free -m | awk 'NR==2{print $4}')
available_mem=$(free -m | awk 'NR==2{print $7}')

echo "Total Memory: ${total_mem} MB"
echo "Used Memory:  ${used_mem} MB"
echo "Free Memory:  ${free_mem} MB"
echo "Available Memory: ${available_mem} MB"

# Calculate and display memory usage percentage
usage_percent=$(awk "BEGIN {printf \"%.2f\", (${used_mem}/${total_mem})*100}")
echo "Memory Usage: ${usage_percent}%"

# Display a warning if usage is high
if (( $(echo "$usage_percent > 80.0" | bc -l) )); then
    echo "WARNING: Memory usage is critically high!"
elif (( $(echo "$usage_percent > 60.0" | bc -l) )); then
    echo "NOTICE: Memory usage is moderate."
else
    echo "INFO: Memory usage is healthy."
fi

echo "-------------------------------------------"

# Show top 5 processes by memory usage
echo "Top 5 Processes by Memory Usage:"
echo "-------------------------------------------"
ps aux --sort=-%mem | head -n 6


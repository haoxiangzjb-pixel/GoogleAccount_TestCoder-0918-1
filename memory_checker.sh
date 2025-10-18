#!/bin/bash

# Script to check system memory usage and save to a randomly named .sh file

# Generate a random filename with .sh extension
RANDOM_FILE="/workspace/memory_report_$(date +%s)_$$.sh"

# Get memory information and save to the random file
{
    echo "System Memory Usage Report - $(date)"
    echo "=================================="
    echo ""
    echo "Memory Summary:"
    free -h
    echo ""
    echo "Detailed Memory Info:"
    cat /proc/meminfo
    echo ""
    echo "Report generated on: $(date)"
} > "$RANDOM_FILE"

echo "Memory usage report saved to: $RANDOM_FILE"

# Show the file was created
ls -l "$RANDOM_FILE"
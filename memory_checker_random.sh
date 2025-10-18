#!/bin/bash

# Script to check system memory usage and save to a randomly named file

# Generate a random filename with timestamp
RANDOM_FILENAME="memory_usage_$(date +%s%N).txt"

echo "Checking memory usage and saving to: $RANDOM_FILENAME"

# Write memory information to the random file
{
    echo "Memory Usage Information:"
    echo "========================="
    free -h
    echo ""
    echo "Detailed Memory Information:"
    echo "============================"
    cat /proc/meminfo
    echo ""
    echo "Memory usage by processes (top 10):"
    echo "=================================="
    ps aux --sort=-%mem | head -11
} > "$RANDOM_FILENAME"

echo "Memory usage information saved to $RANDOM_FILENAME"
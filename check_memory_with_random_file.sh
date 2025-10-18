#!/bin/bash

# Generate a random filename
random_filename=$(mktemp --suffix=.sh)

# Write memory usage information to the randomly named file
{
    echo "# Memory Usage Information - Generated on $(date)"
    echo "# ========================="
    free -h
    echo ""
    echo "# Detailed Memory Information:"
    echo "# ============================"
    cat /proc/meminfo
} > "$random_filename"

echo "Memory usage information has been saved to: $random_filename"

# Display the contents of the file
echo ""
echo "Contents of $random_filename:"
echo "=============================="
cat "$random_filename"
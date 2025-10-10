#!/bin/bash

# Script to check system memory usage and save the report to a file

REPORT_FILE="memory_report_$(date +%s).txt"

echo "Generating memory usage report..."

# Get memory usage details
free -h > "$REPORT_FILE"

# Append additional memory information
echo "" >> "$REPORT_FILE"
echo "Detailed Memory Information:" >> "$REPORT_FILE"
cat /proc/meminfo | grep -E "MemTotal|MemFree|MemAvailable|Buffers|Cached" >> "$REPORT_FILE"

echo "Memory usage report saved to $REPORT_FILE"

# Optional: Print the report to the terminal
echo ""
echo "Report Content:"
echo "----------------"
cat "$REPORT_FILE"
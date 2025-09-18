#!/bin/bash

# Disk usage alert script
# Checks if disk usage exceeds 80% and sends an alert

# Get disk usage percentage (using / as the root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# Check if usage exceeds 80%
if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds the 80% threshold!"
    # You could add email notification or other alerting mechanisms here
    # For now, we'll just output to stderr
    echo "WARNING: Disk usage is at ${USAGE}% which exceeds the 80% threshold!" >&2
    exit 1
else
    echo "Disk usage is at ${USAGE}%, which is within acceptable limits."
    exit 0
fi
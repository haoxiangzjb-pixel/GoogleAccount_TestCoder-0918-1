#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the disk usage percentage (taking only the root filesystem)
USAGE=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//')

# Compare the usage with the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is at ${USAGE}% which is above the threshold of ${THRESHOLD}%"
    exit 1
else
    echo "Disk usage is at ${USAGE}%, which is within the acceptable range."
    exit 0
fi
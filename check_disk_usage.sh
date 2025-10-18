#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the disk usage percentage (taking only the root filesystem)
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is above the threshold of ${THRESHOLD}%"
    exit 1
else
    echo "Disk usage is ${USAGE}% which is within acceptable limits"
    exit 0
fi
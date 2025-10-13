#!/bin/bash

# Check disk usage and alert if over 80%
THRESHOLD=80

# Get the root filesystem usage percentage
USAGE=$(df / | grep -E '^/dev/' | awk '{ print $5 }' | sed 's/%//')

# Check if usage is numeric and compare to threshold
if [[ $USAGE =~ ^[0-9]+$ ]] && [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "ALERT: Disk usage is ${USAGE}% which is over the ${THRESHOLD}% threshold!"
    # You could add an exit code or other actions here if needed
    # exit 1
else
    echo "Disk usage is ${USAGE}%, which is OK."
fi
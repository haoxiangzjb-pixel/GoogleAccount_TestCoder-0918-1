#!/bin/bash

# Check disk usage and alert if over 80%

usage=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is at ${usage}%"
    # You could add more actions here, like sending an email or log
else
    echo "Disk usage is at ${usage}%, which is normal."
fi
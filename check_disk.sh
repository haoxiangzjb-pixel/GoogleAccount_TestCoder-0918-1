#!/bin/bash

# Check disk usage and alert if over 80%
usage=$(df / | grep -v Filesystem | awk '{print $5}' | sed 's/%//g')

if [ "$usage" -gt 80 ]; then
    echo "ALERT: Disk usage is at ${usage}%"
else
    echo "Disk usage is at ${usage}%"
fi
#!/bin/bash

# Check disk usage
usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Set alert threshold
threshold=80

# Compare usage to threshold
if [ "$usage" -gt "$threshold" ]; then
  echo "ALERT: Disk usage is at ${usage}%"
else
  echo "Disk usage is at ${usage}%"
fi
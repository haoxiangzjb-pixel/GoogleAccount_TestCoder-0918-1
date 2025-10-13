#!/bin/bash

# Bash script to get process list and save to a file with a random name

# Generate a random filename
randomFileName="ProcessList_$(shuf -i 10000-99999 -n 1).csv"

# Get the process list and save it to the randomly named file
# Using ps aux and formatting to mimic a simple CSV structure
echo "USER,PID,%CPU,%MEM,VSZ,RSS,TTY,STAT,START,TIME,COMMAND" > "$randomFileName"
ps aux --no-headers | awk '{print $1","$2","$3","$4","$5","$6","$7","$8","$9","$10"," substr($0, index($0, $11)) }' >> "$randomFileName"

echo "Process list exported to $randomFileName"
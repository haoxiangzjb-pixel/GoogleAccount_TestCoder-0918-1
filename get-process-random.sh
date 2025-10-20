#!/bin/bash

# Script to get list of processes and save to a file with random name

# Generate a random filename using current time in nanoseconds to ensure uniqueness
fileName="processes_$(date +%s%N).txt"

# Get the list of processes and save to the randomly named file
ps aux > "$fileName"

echo "Process list saved to $fileName"
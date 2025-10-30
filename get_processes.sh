#!/bin/bash

# Bash script to get list of processes and save to a file with random name

# Generate a random filename
random_name="processes_$(shuf -i 1-99999 -n 1).txt"

# Get the list of processes and save to the file with random name
ps aux > "$random_name"

echo "Process list saved to $random_name"
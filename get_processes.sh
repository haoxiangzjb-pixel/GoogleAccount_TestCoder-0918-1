#!/bin/bash

# Bash script to get a list of processes and save to a file with a random name

# Get the list of processes using ps aux (similar to Get-Process)
processes=$(ps aux)

# Generate a random filename using $RANDOM and append .txt extension
randomFileName=$RANDOM.txt

# Save the processes to the file
echo "$processes" > "$randomFileName"

echo "Process list saved to $randomFileName"
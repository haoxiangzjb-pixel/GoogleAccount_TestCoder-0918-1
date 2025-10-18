#!/bin/bash

# Script to get a list of processes and save to a file with a random name
processes=$(ps aux)
random_filename=$(uuidgen).txt
echo "$processes" > "$random_filename"
echo "Process list saved to $random_filename"
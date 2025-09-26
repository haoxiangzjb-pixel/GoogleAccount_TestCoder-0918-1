#!/bin/bash

# Script to create a backup of a file with a random name

if [ $# -ne 1 ]; then
  echo "Usage: $0 <file_to_backup>"
  exit 1
fi

file_to_backup="$1"

if [ ! -f "$file_to_backup" ]; then
  echo "Error: File '$file_to_backup' does not exist."
  exit 1
fi

# Generate a random filename using /dev/urandom and base64
random_name=$(base64 /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1)
backup_name="/tmp/${random_name}_backup"

# Perform the copy
cp "$file_to_backup" "$backup_name"

if [ $? -eq 0 ]; then
  echo "Backup created successfully: $backup_name"
else
  echo "Error: Failed to create backup."
  exit 1
fi

#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_to_backup>"
    exit 1
fi

# The file to backup
FILE_TO_BACKUP="$1"

# Check if the file exists
if [ ! -f "$FILE_TO_BACKUP" ]; then
    echo "Error: File '$FILE_TO_BACKUP' does not exist."
    exit 1
fi

# Generate a random filename for the backup
BACKUP_NAME="/tmp/backup_$(date +%s%N).bak"

# Create the backup
cp "$FILE_TO_BACKUP" "$BACKUP_NAME"

# Inform the user
echo "Backup created: $BACKUP_NAME"
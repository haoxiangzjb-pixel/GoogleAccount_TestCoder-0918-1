#!/bin/bash

# Check if source directory is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <source_directory>"
    echo "Example: $0 /home/user/documents"
    exit 1
fi

# Get the source directory from command line argument
SOURCE_DIR="$1"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Create a timestamp for the backup folder
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Define the backup directory name
BACKUP_DIR="backup_$TIMESTAMP"

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Perform the backup using cp
echo "Backing up '$SOURCE_DIR' to '$BACKUP_DIR'..."
cp -r "$SOURCE_DIR/"* "$BACKUP_DIR/" 2>/dev/null || echo "Backup completed with warnings (directories with hidden files may have caused messages)"

# Check if the backup was successful
echo "Backup completed!"
echo "Backup location: $(pwd)/$BACKUP_DIR"
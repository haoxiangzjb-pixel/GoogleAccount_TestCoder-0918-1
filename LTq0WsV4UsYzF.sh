#!/bin/bash

# Check if source directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <source_directory>"
  exit 1
fi

SOURCE_DIR="$1"

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Create destination directory name with timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="backup_$TIMESTAMP"

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Perform the backup using rsync
echo "Backing up '$SOURCE_DIR' to '$BACKUP_DIR'..."
rsync -av --exclude='*.tmp' "$SOURCE_DIR/" "$BACKUP_DIR/"

# Check if rsync was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully in '$BACKUP_DIR'."
else
  echo "Backup failed."
  exit 1
fi
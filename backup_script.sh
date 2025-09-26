#!/bin/bash

# Check if source directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <source_directory> [destination_directory]"
  echo "  destination_directory defaults to ./backups if not provided"
  exit 1
fi

SOURCE_DIR="$1"
DEST_DIR="${2:-./backups}"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create destination backup folder name
BACKUP_NAME="$DEST_DIR/backup_$TIMESTAMP"

# Perform the copy using rsync for efficiency and robustness
echo "Backing up '$SOURCE_DIR' to '$BACKUP_NAME'..."
rsync -a "$SOURCE_DIR/" "$BACKUP_NAME/"

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully: $BACKUP_NAME"
else
  echo "Backup failed!"
  exit 1
fi
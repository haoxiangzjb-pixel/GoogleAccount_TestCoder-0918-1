#!/bin/bash

# Backup script - backs up a directory to a timestamped folder

# Check if source directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <source_directory> [backup_destination]"
    echo "  source_directory: Directory to backup (required)"
    echo "  backup_destination: Where to store backups (default: ./backups)"
    exit 1
fi

SOURCE_DIR="$1"
BACKUP_DEST="${2:-./backups}"

# Validate source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Create backup destination if it doesn't exist
mkdir -p "$BACKUP_DEST"

# Generate timestamp for the backup folder
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FOLDER="backup_$TIMESTAMP"
BACKUP_PATH="$BACKUP_DEST/$BACKUP_FOLDER"

# Perform the backup
echo "Backing up '$SOURCE_DIR' to '$BACKUP_PATH'..."
if cp -r "$SOURCE_DIR" "$BACKUP_PATH"; then
    echo "Backup completed successfully!"
    echo "Backup location: $BACKUP_PATH"
else
    echo "Error: Backup failed."
    exit 1
fi

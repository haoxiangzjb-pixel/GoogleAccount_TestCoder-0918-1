#!/bin/bash

# Generate a random string
RANDOM_STRING=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)

# Define the new filename with .php extension
NEW_FILENAME="${RANDOM_STRING}.php"

# Copy the form processor to the new filename
cp /workspace/form_processor.php "/workspace/${NEW_FILENAME}"

# Display the new filename
echo "PHP form processor saved as: ${NEW_FILENAME}"
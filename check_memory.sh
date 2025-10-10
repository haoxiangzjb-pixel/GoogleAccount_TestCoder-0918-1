#!/bin/bash

# Generate a random filename for the script
random_name=$(mktemp --suffix=.sh)

# Write the memory check command to the random file
cat << 'EOF' > "$random_name"
#!/bin/bash
# Script to check memory usage
echo "Memory usage information:"
free -h
EOF

# Make the generated script executable
chmod +x "$random_name"

echo "Memory check script created at: $random_name"
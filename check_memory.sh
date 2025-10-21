#!/bin/bash

# Script to check system memory usage and save to a randomly named .sh file

# Function to generate random filename
generate_random_name() {
    random_name="memory_check_$(date +%s).sh"
    echo "$random_name"
}

# Get memory usage information
get_memory_info() {
    echo "#!/bin/bash"
    echo "# Memory Usage Report - Generated on $(date)"
    echo ""
    echo "# Memory usage summary:"
    free -h
    echo ""
    echo "# Detailed memory information:"
    cat /proc/meminfo
    echo ""
    echo "# Swap usage:"
    swapon --show
}

# Generate random filename
RANDOM_FILENAME=$(generate_random_name)

# Save memory information to the randomly named file
get_memory_info > "$RANDOM_FILENAME"

echo "Memory usage information saved to: $RANDOM_FILENAME"
echo "File contents:"
echo "----------------------------------------"
cat "$RANDOM_FILENAME" | head -20  # Show first 20 lines of the generated file
echo "----------------------------------------"
echo "... (file continues)"
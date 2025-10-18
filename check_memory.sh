#!/bin/bash

# Script to check system memory usage and save to a randomly named .sh file

# Function to generate random filename
generate_random_filename() {
    echo "memory_check_$(date +%s%N | cut -b10-17).sh"
}

# Get memory usage information
get_memory_info() {
    echo "#!/bin/bash"
    echo "# Memory usage information generated on $(date)"
    echo ""
    echo "# Memory usage details:"
    free -h
    echo ""
    echo "# Detailed memory information:"
    cat /proc/meminfo | head -20
    echo ""
    echo "# Swap usage:"
    swapon --show
}

# Generate random filename
random_filename=$(generate_random_filename)

# Save memory information to the randomly named file
get_memory_info > "$random_filename"

echo "Memory usage information has been saved to $random_filename"

# Make the generated file executable
chmod +x "$random_filename"

# Show the content of the generated file
echo ""
echo "Content of $random_filename:"
echo "----------------------------------------"
cat "$random_filename"
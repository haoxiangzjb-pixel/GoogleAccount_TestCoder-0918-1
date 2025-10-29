#!/bin/bash

# Generate a random name for the memory check script
random_name="memory_check_$(openssl rand -hex 6).sh"

# Content of the memory check script
memory_script_content="#!/bin/bash

# Script to check system memory usage
echo \"Memory Usage Information:\"
echo \"=========================\"
free -h

echo \"\"
echo \"Detailed Memory Information:\"
echo \"============================\"
cat /proc/meminfo

echo \"\"
echo \"Memory Usage by Processes (Top 10):\" 
echo \"==================================\"
ps aux --sort=-%mem | head -11"

# Write the content to the randomly named file
echo "$memory_script_content" > "$random_name"

echo "Memory check script created with random name: $random_name"
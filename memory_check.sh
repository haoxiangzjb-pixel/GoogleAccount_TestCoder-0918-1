#!/bin/bash

# Script to check system memory usage and display it

echo "Memory Usage Information:"
echo "========================="
free -h
echo ""
echo "Detailed Memory Information:"
echo "============================"
cat /proc/meminfo
#!/bin/bash

# Script to check system memory usage
echo "Memory Usage Information:"
echo "========================="
free -h
echo ""
echo "Detailed Memory Information:"
echo "============================"
cat /proc/meminfo
echo ""
echo "Memory usage by processes (top 10):"
echo "=================================="
ps aux --sort=-%mem | head -11
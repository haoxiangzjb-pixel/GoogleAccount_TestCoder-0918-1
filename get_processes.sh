#!/bin/bash
# Script to get list of processes and save to a file with random name

# Get the process list using ps command and save to a temporary file with random name
random_file_name="processes_$(shuf -i 10000-99999 -n 1).csv"

# Use ps to get process information and format it similar to PowerShell's Get-Process
echo "PID,PPID,USER,STAT,VSZ,RSS,TTY,TIME,CMD" > "$random_file_name"
ps -eo pid,ppid,user,stat,vsz,rss,tty,time,comm >> "$random_file_name"

echo "Process list saved to $random_file_name"
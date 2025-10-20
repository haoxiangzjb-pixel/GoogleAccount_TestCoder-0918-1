#!/usr/bin/env python3
"""
Python script to simulate the PowerShell script that gets a list of processes
and saves to a file with a random name.
"""

import psutil
import random
import string
from datetime import datetime

def generate_random_filename():
    """Generate a random filename similar to what the PowerShell script would create."""
    random_num = random.randint(1, 99999)
    return f"processes_{random_num}.txt"

def get_process_list():
    """Get a list of processes similar to PowerShell Get-Process."""
    processes = []
    for proc in psutil.process_iter(['pid', 'name', 'username', 'status']):
        try:
            # Get process info
            proc_info = {
                'pid': proc.info['pid'],
                'name': proc.info['name'],
                'username': proc.info['username'],
                'status': proc.info['status']
            }
            processes.append(proc_info)
        except (psutil.NoSuchProcess, psutil.AccessDenied):
            # Process may have terminated during iteration
            continue
    return processes

def save_processes_to_file(processes, filename):
    """Save the process list to a file in a format similar to PowerShell output."""
    with open(filename, 'w', encoding='utf-8') as f:
        # Write header similar to PowerShell output
        f.write("Handles  NPM(K)    PM(K)      WS(K) VM(M)   CPU(s)     Id ProcessName\n")
        f.write("-------  ------    -----      ----- -----   ------     -- -----------\n")
        
        for proc in processes:
            # Format similar to PowerShell Get-Process output
            # Using placeholder values for fields that psutil doesn't directly provide
            f.write(f"{' '*7} {' '*6} {' '*7} {' '*8} {' '*5} {' '*8} {proc['pid']:>6} {proc['name']}\n")
    
    print(f"Process list saved to: {filename}")

if __name__ == "__main__":
    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Get the list of processes
    process_list = get_process_list()
    
    # Save the processes to the file
    save_processes_to_file(process_list, random_filename)
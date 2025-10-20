# Process List Scripts

## PowerShell Script
The file `get-process-random.ps1` is a PowerShell script that gets a list of processes and saves it to a file with a random name. This script will only work in a Windows environment with PowerShell installed.

```powershell
# PowerShell script to get list of processes and save to a file with random name

# Generate a random filename using GUID to ensure uniqueness
$fileName = "processes_$(New-Guid).txt"

# Get the list of processes and export to the randomly named file
Get-Process | Out-File -FilePath $fileName

Write-Output "Process list saved to $fileName"
```

## Bash Script (Alternative)
The file `get-process-random.sh` is an alternative script using Bash commands that will work in Linux/Unix environments. It uses `ps aux` to get the process list and saves it to a file with a random name based on the current time in nanoseconds.

To run the bash script:
1. Make it executable: `chmod +x get-process-random.sh`
2. Execute it: `./get-process-random.sh`

## Example Output File
An example output file (`example_processes_*.txt`) is included to show what the process list might look like when saved. This demonstrates the format of the data that would be saved by the PowerShell script when run in a Windows environment.
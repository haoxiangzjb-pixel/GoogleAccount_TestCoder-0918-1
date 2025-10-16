#!/bin/bash

# Script to generate a PowerShell script with current user information and save it with a random name

# Get current user information using bash commands (mimicking PowerShell functionality)
USERNAME=$(whoami)
USERDOMAIN=$(hostname)
COMPUTERNAME=$(hostname)
HOMEDIRECTORY=$(echo $HOME)
CURRENTDATE=$(date)

# Determine if user is root (equivalent to administrator in Linux)
if [ "$EUID" -eq 0 ] || [ "$USERNAME" = "root" ]; then
    IS_ADMINISTRATOR="True"
else
    IS_ADMINISTRATOR="False"
fi

# Generate a random filename with .ps1 extension
RANDOM_FILENAME="UserInfo_$(date +%Y%m%d_%H%M%S)_$(shuf -i 1000-9999 -n 1).ps1"

# Create the PowerShell script content
cat << EOF > "$RANDOM_FILENAME"
# User Information Script
# Generated on: $(date)

\$userInfo = @{
    "UserName" = "$USERNAME"
    "UserDomain" = "$USERDOMAIN"
    "ComputerName" = "$COMPUTERNAME"
    "UserSID" = "N/A on Linux"
    "IsAdministrator" = $IS_ADMINISTRATOR
    "HomeDirectory" = "$HOMEDIRECTORY"
    "ExecutionPolicy" = "N/A on Linux"
    "CurrentDate" = "$(date)"
}

# Display the information
Write-Host "User Information:" -ForegroundColor Cyan
\$userInfo.GetEnumerator() | ForEach-Object {
    Write-Host "\$(`$_.Key): \$(`$_.Value)"
}

# Return the user info
return \$userInfo
EOF

echo "PowerShell script with user information has been created: $RANDOM_FILENAME"
echo "User Information:"
echo "==================="
echo "UserName: $USERNAME"
echo "UserDomain: $USERDOMAIN"
echo "ComputerName: $COMPUTERNAME"
echo "IsAdministrator: $IS_ADMINISTRATOR"
echo "HomeDirectory: $HOMEDIRECTORY"
echo "CurrentDate: $CURRENTDATE"
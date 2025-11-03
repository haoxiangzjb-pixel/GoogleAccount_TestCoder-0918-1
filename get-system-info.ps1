# Função PowerShell para obter informações do sistema e salvar em um arquivo com nome aleatório
function Get-SystemInfo {
    # Obtém informações do sistema
    $systemInfo = @{
        ComputerName = $env:COMPUTERNAME
        UserName = $env:USERNAME
        OS = (Get-CimInstance Win32_OperatingSystem).Caption
        OSVersion = (Get-CimInstance Win32_OperatingSystem).Version
        TotalMemory = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory
        FreeMemory = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory * 1024
        CPUCores = (Get-CimInstance Win32_ComputerSystem).NumberOfLogicalProcessors
        DiskInfo = Get-CimInstance Win32_LogicalDisk | Select-Object DeviceID, Size, FreeSpace
        Uptime = (Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    }

    # Gera um nome de arquivo aleatório
    $randomFileName = "system_info_" + (Get-Date -Format "yyyyMMdd_HHmmss") + "_" + (Get-Random -Maximum 10000).ToString("0000") + ".txt"
    
    # Converte as informações para string e salva no arquivo
    $output = "System Information Report`n"
    $output += "=======================`n"
    $output += "Computer Name: $($systemInfo.ComputerName)`n"
    $output += "User Name: $($systemInfo.UserName)`n"
    $output += "OS: $($systemInfo.OS)`n"
    $output += "OS Version: $($systemInfo.OSVersion)`n"
    $output += "Total Memory: $([math]::Round($($systemInfo.TotalMemory)/1GB, 2)) GB`n"
    $output += "Free Memory: $([math]::Round($($systemInfo.FreeMemory)/1GB, 2)) GB`n"
    $output += "CPU Cores: $($systemInfo.CPUCores)`n"
    $output += "Uptime: $($systemInfo.Uptime)`n"
    $output += "`nDisk Information:`n"
    foreach ($disk in $systemInfo.DiskInfo) {
        if ($disk.Size -gt 0) {
            $diskSize = [math]::Round($disk.Size/1GB, 2)
            $diskFree = [math]::Round($disk.FreeSpace/1GB, 2)
            $output += "  $($disk.DeviceID): $diskFree GB free of $diskSize GB`n"
        }
    }

    # Salva as informações no arquivo
    $output | Out-File -FilePath $randomFileName -Encoding UTF8
    
    Write-Host "System information saved to: $randomFileName"
    return $randomFileName
}

# Chama a função
Get-SystemInfo
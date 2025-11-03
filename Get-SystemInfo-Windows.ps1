function Get-SystemInfo {
    <#
    .SYNOPSIS
        Obtém informações do sistema e salva em um arquivo com nome aleatório.
    
    .DESCRIPTION
        Esta função coleta várias informações do sistema como nome do computador, 
        sistema operacional, processador, memória, etc., e as salva em um arquivo 
        com um nome aleatório no diretório atual.
    
    .EXAMPLE
        Get-SystemInfo
        # Gera um arquivo com informações do sistema com nome aleatório
    #>
    
    # Coletar informações do sistema usando métodos mais modernos e compatíveis
    $systemInfo = @{}
    
    # Informações básicas do sistema
    $systemInfo.ComputerName = $env:COMPUTERNAME
    $systemInfo.UserName = $env:USERNAME
    $systemInfo.DateTime = Get-Date
    
    # Informações do sistema operacional
    if (Get-Command Get-CimInstance -ErrorAction SilentlyContinue) {
        $os = Get-CimInstance Win32_OperatingSystem
        $cs = Get-CimInstance Win32_ComputerSystem
        $cpu = Get-CimInstance Win32_Processor
    } else {
        $os = Get-WmiObject -Class Win32_OperatingSystem
        $cs = Get-WmiObject -Class Win32_ComputerSystem
        $cpu = Get-WmiObject -Class Win32_Processor
    }
    
    $systemInfo.OperatingSystem = $os.Caption
    $systemInfo.OSVersion = $os.Version
    $systemInfo.OSArchitecture = $os.OSArchitecture
    $systemInfo.TotalPhysicalMemory = [math]::Round([long]$cs.TotalPhysicalMemory / 1GB, 2)
    $systemInfo.Processor = $cpu.Name
    $systemInfo.NumberOfCores = $cpu.NumberOfCores
    $systemInfo.NumberOfLogicalProcessors = $cpu.NumberOfLogicalProcessors
    $systemInfo.LastBootUpTime = $os.LastBootUpTime
    $systemInfo.FreePhysicalMemory = [math]::Round([long]$os.FreePhysicalMemory / 1MB, 2)
    
    # Informações de disco
    $disks = Get-WmiObject -Class Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3}
    $systemInfo.Disks = @()
    foreach ($disk in $disks) {
        $diskInfo = @{
            DeviceID = $disk.DeviceID
            SizeGB = [math]::Round([long]$disk.Size / 1GB, 2)
            FreeSpaceGB = [math]::Round([long]$disk.FreeSpace / 1GB, 2)
            UsedSpaceGB = [math]::Round(([long]$disk.Size - [long]$disk.FreeSpace) / 1GB, 2)
        }
        $systemInfo.Disks += $diskInfo
    }
    
    # Gerar nome aleatório para o arquivo
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $randomNumber = Get-Random -Minimum 1000 -Maximum 9999
    $randomName = "SystemInfo_${timestamp}_${randomNumber}.txt"
    
    # Converter as informações para string e salvar no arquivo
    $output = "Informações do Sistema - $(Get-Date)`n"
    $output += "=" * 50 + "`n"
    
    foreach ($key in $systemInfo.Keys) {
        if ($key -eq "Disks") {
            $output += "$key`:`n"
            foreach ($disk in $systemInfo[$key]) {
                $output += "  $($disk.DeviceID): $($disk.SizeGB)GB total, $($disk.FreeSpaceGB)GB livre, $($disk.UsedSpaceGB)GB usado`n"
            }
        } else {
            $output += "$key`: $($systemInfo[$key])`n"
        }
    }
    
    # Salvar no arquivo
    $output | Out-File -FilePath $randomName -Encoding UTF8
    
    Write-Host "Informações do sistema salvas no arquivo: $randomName"
    return $randomName
}

# Exportar a função para que possa ser usada em outros contextos
Export-ModuleMember -Function Get-SystemInfo
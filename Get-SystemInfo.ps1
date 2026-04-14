function Get-SystemInfo {
    <#
    .SYNOPSIS
        Obtém informações do sistema e salva em um arquivo com nome aleatório.
    
    .DESCRIPTION
        Esta função coleta informações detalhadas do sistema Windows e as salva
        em um arquivo de texto com nome aleatório no diretório especificado.
    
    .PARAMETER OutputPath
        Caminho do diretório onde o arquivo será salvo. Padrão: diretório atual.
    
    .EXAMPLE
        Get-SystemInfo
        Salva as informações do sistema no diretório atual.
    
    .EXAMPLE
        Get-SystemInfo -OutputPath "C:\Logs"
        Salva as informações do sistema no diretório C:\Logs.
    #>
    
    param(
        [string]$OutputPath = (Get-Location).Path
    )
    
    # Gera nome aleatório para o arquivo
    $randomString = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count 12 | ForEach-Object {[char]$_})
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $fileName = "SystemInfo_${timestamp}_${randomString}.txt"
    $filePath = Join-Path -Path $OutputPath -ChildPath $fileName
    
    # Coleta informações do sistema
    $systemInfo = @"
========================================
INFORMAÇÕES DO SISTEMA
Gerado em: $(Get-Date -Format "dd/MM/yyyy HH:mm:ss")
========================================

--- INFORMAÇÕES DO COMPUTADOR ---
$(Get-WmiObject -Class Win32_ComputerSystem | Select-Object Name, Manufacturer, Model, TotalPhysicalMemory, NumberOfProcessors | Format-List | Out-String)

--- SISTEMA OPERACIONAL ---
$(Get-WmiObject -Class Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, LastBootUpTime | Format-List | Out-String)

--- PROCESSADOR ---
$(Get-WmiObject -Class Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed | Format-List | Out-String)

--- MEMÓRIA RAM ---
$(Get-WmiObject -Class Win32_PhysicalMemory | Select-Object Capacity, Speed, Manufacturer | Format-Table | Out-String)

--- DISCOS ---
$(Get-WmiObject -Class Win32_DiskDrive | Select-Object Model, Size, MediaType | Format-Table | Out-String)

--- ESPAÇO EM DISCO ---
$(Get-WmiObject -Class Win32_LogicalDisk | Where-Object {$_.DriveType -eq 3} | Select-Object DeviceID, Size, FreeSpace | Format-Table | Out-String)

--- REDE ---
$(Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object {$_.IPEnabled -eq $true} | Select-Object Description, IPAddress, IPSubnet, DefaultIPGateway | Format-List | Out-String)

--- SERVIÇOS EM EXECUÇÃO ---
$(Get-Service | Where-Object {$_.Status -eq 'Running'} | Select-Object Name, DisplayName, Status | Format-Table | Out-String)

--- PROCESSOS EM EXECUÇÃO (Top 20 por memória) ---
$(Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 20 Name, Id, WorkingSet, CPU | Format-Table | Out-String)

========================================
FIM DO RELATÓRIO
========================================
"@
    
    # Salva as informações no arquivo
    $systemInfo | Out-File -FilePath $filePath -Encoding UTF8
    
    Write-Host "Informações do sistema salvas em: $filePath" -ForegroundColor Green
    
    return $filePath
}

# Exporta a função para uso
Export-ModuleMember -Function Get-SystemInfo

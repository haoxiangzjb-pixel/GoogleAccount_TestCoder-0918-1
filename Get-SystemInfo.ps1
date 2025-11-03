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
    
    # Coletar informações do sistema
    $systemInfo = @{
        ComputerName = $env:COMPUTERNAME
        UserName = $env:USERNAME
        OperatingSystem = (Get-WmiObject -Class Win32_OperatingSystem).Caption
        OSVersion = (Get-WmiObject -Class Win32_OperatingSystem).Version
        OSArchitecture = (Get-WmiObject -Class Win32_OperatingSystem).OSArchitecture
        TotalPhysicalMemory = [math]::Round((Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
        FreePhysicalMemory = [math]::Round((Get-WmiObject -Class Win32_OperatingSystem).FreePhysicalMemory / 1MB, 2)
        Processor = (Get-WmiObject -Class Win32_Processor).Name
        TotalVisibleMemorySize = [math]::Round((Get-WmiObject -Class Win32_OperatingSystem).TotalVisibleMemorySize / 1MB, 2)
        LastBootUpTime = (Get-WmiObject -Class Win32_OperatingSystem).LastBootUpTime
        LocalDateTime = (Get-WmiObject -Class Win32_OperatingSystem).LocalDateTime
        IPAddress = (Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object {$_.IPEnabled -eq $true}).IPAddress | Out-String
    }
    
    # Gerar nome aleatório para o arquivo
    $randomName = "SystemInfo_" + (Get-Date -Format "yyyyMMdd_HHmmss") + "_" + (Get-Random -Maximum 10000).ToString("0000") + ".txt"
    
    # Converter as informações para string e salvar no arquivo
    $output = ""
    $output += "Informações do Sistema - $(Get-Date)`n"
    $output += "=" * 50 + "`n"
    
    foreach ($key in $systemInfo.Keys) {
        $output += "$key`: $($systemInfo[$key])`n"
    }
    
    # Salvar no arquivo
    $output | Out-File -FilePath $randomName -Encoding UTF8
    
    Write-Host "Informações do sistema salvas no arquivo: $randomName"
    Write-Output $randomName
}

# Chamar a função
Get-SystemInfo
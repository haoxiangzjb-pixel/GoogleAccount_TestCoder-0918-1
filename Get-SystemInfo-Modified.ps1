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
    
    # Coletar informações do sistema (adicionando verificações para diferentes sistemas)
    $systemInfo = @{}
    
    try {
        $systemInfo.ComputerName = $env:COMPUTERNAME
    } catch { $systemInfo.ComputerName = "N/A" }
    
    try {
        $systemInfo.UserName = $env:USERNAME
    } catch { $systemInfo.UserName = "N/A" }
    
    try {
        $os = Get-WmiObject -Class Win32_OperatingSystem -ErrorAction SilentlyContinue
        if ($os) {
            $systemInfo.OperatingSystem = $os.Caption
            $systemInfo.OSVersion = $os.Version
            $systemInfo.OSArchitecture = $os.OSArchitecture
        } else {
            $systemInfo.OperatingSystem = $PSVersionTable.OS
            $systemInfo.OSVersion = $PSVersionTable.Platform
            $systemInfo.OSArchitecture = $PSVersionTable.OSArchitecture
        }
    } catch {
        $systemInfo.OperatingSystem = $PSVersionTable.OS
        $systemInfo.OSVersion = $PSVersionTable.Platform
        $systemInfo.OSArchitecture = $PSVersionTable.OSArchitecture
    }
    
    try {
        $computerSystem = Get-WmiObject -Class Win32_ComputerSystem -ErrorAction SilentlyContinue
        if ($computerSystem) {
            $systemInfo.TotalPhysicalMemory = [math]::Round($computerSystem.TotalPhysicalMemory / 1GB, 2)
        } else {
            $systemInfo.TotalPhysicalMemory = "N/A"
        }
    } catch { $systemInfo.TotalPhysicalMemory = "N/A" }
    
    try {
        $processor = Get-WmiObject -Class Win32_Processor -ErrorAction SilentlyContinue
        if ($processor) {
            $systemInfo.Processor = $processor.Name
        } else {
            $systemInfo.Processor = "N/A"
        }
    } catch { $systemInfo.Processor = "N/A" }
    
    # Gerar nome aleatório para o arquivo
    $randomName = "SystemInfo_" + (Get-Date -Format "yyyyMMdd_HHmmss") + "_" + (Get-Random -Maximum 10000).ToString("0000") + ".txt"
    
    # Converter as informações para string e salvar no arquivo
    $output = ""
    $output += "Informações do Sistema - $(Get-Date)`n"
    $output += "=" * 50 + "`n"
    
    foreach ($key in $systemInfo.Keys) {
        $output += "$key`: $($systemInfo[$key])`n"
    }
    
    # Adicionar informações adicionais que funcionam em qualquer plataforma
    $output += "PowerShellVersion`: $($PSVersionTable.PSVersion)`n"
    $output += "PSEdition`: $($PSVersionTable.PSEdition)`n"
    $output += "Platform`: $($PSVersionTable.Platform)`n"
    
    # Salvar no arquivo
    $output | Out-File -FilePath $randomName -Encoding UTF8
    
    Write-Host "Informações do sistema salvas no arquivo: $randomName"
    Write-Output $randomName
}

# Chamar a função
Get-SystemInfo
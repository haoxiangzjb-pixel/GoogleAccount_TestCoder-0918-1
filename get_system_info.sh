#!/bin/bash

# Função para obter informações do sistema e salvar em um arquivo com nome aleatório
get_system_info() {
    # Gerar nome aleatório para o arquivo
    random_name="SystemInfo_$(date +%Y%m%d_%H%M%S)_$(printf "%04d" $((RANDOM % 10000))).txt"
    
    # Coletar informações do sistema
    echo "Informações do Sistema - $(date)" > "$random_name"
    echo "==================================================" >> "$random_name"
    echo "Hostname: $(hostname)" >> "$random_name"
    echo "Sistema Operacional: $(uname -s)" >> "$random_name"
    echo "Versão do Sistema: $(uname -r)" >> "$random_name"
    echo "Arquitetura: $(uname -m)" >> "$random_name"
    echo "Tipo de Máquina: $(uname -o)" >> "$random_name"
    
    # Informações de CPU
    if [ -f /proc/cpuinfo ]; then
        echo "Processador: $(grep 'model name' /proc/cpuinfo | head -n 1 | cut -d ':' -f 2 | sed 's/^ *//')" >> "$random_name"
        echo "Cores: $(nproc)" >> "$random_name"
    fi
    
    # Informações de memória
    if [ -f /proc/meminfo ]; then
        echo "Memória Total: $(grep 'MemTotal' /proc/meminfo | awk '{print $2/1024/1024 " GB"}')" >> "$random_name"
    fi
    
    # Espaço em disco
    echo "Espaço em Disco (raiz): $(df -h / | awk 'NR==2{print $2}')" >> "$random_name"
    echo "Espaço Usado (raiz): $(df -h / | awk 'NR==2{print $3}')" >> "$random_name"
    echo "Espaço Livre (raiz): $(df -h / | awk 'NR==2{print $4}')" >> "$random_name"
    
    # Informações de usuário
    echo "Usuário Atual: $(whoami)" >> "$random_name"
    echo "Todos os Usuários: $(cut -d: -f1 /etc/passwd | tr '\n' ' ')" >> "$random_name"
    
    # Informações de rede
    echo "Endereço IP: $(hostname -I 2>/dev/null || echo 'Não disponível')" >> "$random_name"
    
    # Informações de tempo de atividade
    echo "Tempo de Atividade: $(uptime -p 2>/dev/null || uptime)" >> "$random_name"
    
    # Versão do shell
    echo "Shell: $SHELL" >> "$random_name"
    
    echo "Informações do sistema salvas no arquivo: $random_name"
    echo "$random_name"
}

# Chamar a função
get_system_info
// Script para manipular o DOM e salvar em arquivo com nome aleatório

function manipulateDOMAndSave() {
    // Verifica se estamos no navegador (para manipulação do DOM)
    if (typeof document !== 'undefined') {
        // Seleciona um elemento (vamos usar um elemento com id 'target' como exemplo)
        const targetElement = document.getElementById('target');
        
        if (targetElement) {
            // Altera o texto do elemento
            const newText = 'Texto alterado pelo script DOM!';
            targetElement.textContent = newText;
            
            // Gera um nome de arquivo aleatório
            const randomFileName = generateRandomFileName();
            
            // Cria o conteúdo a ser salvo
            const content = `Arquivo gerado em: ${new Date().toISOString()}\nNovo texto do elemento: ${newText}\n`;
            
            // Salva o conteúdo em um arquivo
            saveToFile(content, randomFileName);
            
            console.log(`Texto alterado e salvo no arquivo: ${randomFileName}`);
        } else {
            console.log('Elemento com id "target" não encontrado.');
        }
    } else {
        console.log('Este script deve ser executado em um ambiente com DOM (navegador).');
    }
}

function generateRandomFileName() {
    // Gera um nome de arquivo aleatório
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = 'dom_output_';
    for (let i = 0; i < 10; i++) {
        result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    result += '.txt';
    return result;
}

function saveToFile(content, filename) {
    // Cria um Blob com o conteúdo
    const blob = new Blob([content], { type: 'text/plain' });
    
    // Cria um URL para o blob
    const url = URL.createObjectURL(blob);
    
    // Cria um elemento <a> para download
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    
    // Simula o clique para fazer o download
    document.body.appendChild(a);
    a.click();
    
    // Limpa após o download
    document.body.removeChild(a);
    URL.revokeObjectURL(url);
}

// Executa a função quando o DOM estiver carregado
if (typeof document !== 'undefined' && document.readyState !== 'loading') {
    manipulateDOMAndSave();
} else if (typeof document !== 'undefined') {
    document.addEventListener('DOMContentLoaded', manipulateDOMAndSave);
}

// Exporta a função para uso em outros contextos, se necessário
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { manipulateDOMAndSave, generateRandomFileName };
}
# Programa Haskell - Gravador de Arquivo com Nome Aleatório

Este diretório contém um programa Haskell que lê entrada do usuário e salva em um arquivo com nome aleatório.

## Descrição

O programa `random_file_writer.hs` faz o seguinte:

1. Lê a entrada do usuário até que o fim da entrada seja alcançado (Ctrl+D no Unix/Linux ou Ctrl+Z no Windows)
2. Gera um nome de arquivo aleatório composto por 10 caracteres alfanuméricos
3. Salva o conteúdo digitado em um arquivo .txt com o nome aleatório gerado
4. Exibe o nome do arquivo onde o conteúdo foi salvo

## Como Executar

Para executar este programa, você precisará ter o GHC (Glasgow Haskell Compiler) instalado em seu sistema:

```bash
# Compilar o programa
ghc random_file_writer.hs

# Executar o programa compilado
./random_file_writer

# Ou executar diretamente com runhaskell
runhaskell random_file_writer.hs
```

## Funcionalidades

- Geração de nomes de arquivo aleatórios contendo letras maiúsculas, minúsculas e números
- Leitura de múltiplas linhas de entrada do usuário
- Criação automática de arquivos com extensão .txt

## Código Fonte

O arquivo `random_file_writer.hs` contém:

- Funções para geração de strings aleatórias
- Função para gerar nomes de arquivos aleatórios
- Função principal que lida com a entrada do usuário e gravação no arquivo
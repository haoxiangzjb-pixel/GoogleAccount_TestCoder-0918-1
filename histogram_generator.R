# Função para gerar um histograma e salvar em um arquivo com nome aleatório
generate_histogram <- function(data = NULL, output_dir = ".", prefix = "histogram_") {
  # Se não for fornecido um conjunto de dados, gera um aleatório
  if (is.null(data)) {
    data <- rnorm(1000, mean = 50, sd = 10)  # Gerando 1000 valores normais com média 50 e desvio padrão 10
  }
  
  # Gerando um nome de arquivo aleatório
  random_suffix <- paste(sample(c(letters, LETTERS, 0:9), 10, replace = TRUE), collapse = "")
  filename <- paste0(prefix, random_suffix, ".png")
  filepath <- file.path(output_dir, filename)
  
  # Criando o histograma
  png(filepath, width = 800, height = 600)  # Cria um arquivo PNG com dimensões específicas
  hist(data, 
       main = "Histograma Gerado", 
       xlab = "Valores", 
       ylab = "Frequência", 
       col = "lightblue", 
       border = "black")
  dev.off()  # Fecha o dispositivo gráfico
  
  cat("Histograma salvo em:", filepath, "\n")
  return(filepath)
}

# Exemplo de uso:
# generate_histogram()
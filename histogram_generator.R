# Função para gerar um histograma e salvar em um arquivo com nome aleatório
generate_histogram <- function(data = NULL, n = 100, filename_prefix = "histogram", output_dir = ".") {
  # Se não for fornecido um conjunto de dados, gere um aleatório normal
  if (is.null(data)) {
    data <- rnorm(n)
  }
  
  # Gerar um nome de arquivo aleatório
  random_suffix <- paste(sample(c(letters, LETTERS, 0:9), 10), collapse = "")
  filename <- file.path(output_dir, sprintf("%s_%s.png", filename_prefix, random_suffix))
  
  # Salvar o histograma em um arquivo PNG
  png(filename, width = 800, height = 600)
  hist(data, 
       main = "Histograma Gerado", 
       xlab = "Valores", 
       ylab = "Frequência", 
       col = "lightblue", 
       border = "black")
  dev.off()
  
  # Retornar o nome do arquivo gerado
  return(filename)
}

# Exemplo de uso:
# arquivo_gerado <- generate_histogram()
# print(paste("Histograma salvo em:", arquivo_gerado))
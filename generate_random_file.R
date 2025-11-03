# Generar un nombre de archivo aleatorio
random_name <- paste0("funcion_desviacion_", sample(10000:99999, 1), ".R")

# Contenido de la función
funcion_codigo <- '# Función para calcular la desviación estándar
calcular_desviacion_estandar <- function(datos) {
  # Verificar que la entrada no esté vacía
  if (length(datos) == 0) {
    stop("El vector de datos está vacío")
  }
  
  # Calcular la media
  media <- mean(datos)
  
  # Calcular la varianza
  varianza <- sum((datos - media)^2) / (length(datos) - 1)
  
  # Calcular la desviación estándar (raíz cuadrada de la varianza)
  desviacion_estandar <- sqrt(varianza)
  
  return(desviacion_estandar)
}

# Alternativamente, podemos usar la función sd() de R como referencia
calcular_desviacion_estandar_builtin <- function(datos) {
  return(sd(datos))
}'

# Escribir la función en el archivo con nombre aleatorio
cat(funcion_codigo, file = random_name)

# Mostrar el nombre del archivo generado
cat("Función guardada en:", random_name, "\n")
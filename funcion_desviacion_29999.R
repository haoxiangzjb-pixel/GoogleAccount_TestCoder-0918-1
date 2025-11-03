# Función para calcular la desviación estándar
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
}
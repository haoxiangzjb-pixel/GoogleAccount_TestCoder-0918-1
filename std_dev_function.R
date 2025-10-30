# Función para calcular la desviación estándar
calcular_desviacion_estandar <- function(datos) {
  if (is.numeric(datos) && length(datos) > 1) {
    desviacion <- sd(datos)
    return(desviacion)
  } else {
    stop("Los datos deben ser numéricos y contener más de un elemento.")
  }
}
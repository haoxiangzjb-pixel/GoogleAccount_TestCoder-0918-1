import strutils, random, times

# Inicializar generador de números aleatorios
randomize()

# Función para generar un nombre de archivo aleatorio
proc generateRandomFileName(): string =
  let timestamp = int(epochTime())
  let randomNum = rand(100000..999999)
  return "nombre_formateado_" & $timestamp & "_" & $randomNum & ".txt"

# Función para formatear el nombre completo
proc formatFullName(firstName, lastName: string): string =
  # Convertir a mayúsculas la primera letra y minúsculas las demás
  let formattedFirstName = firstName.capitalizeAscii()
  let formattedLastName = lastName.capitalizeAscii()
  return formattedFirstName & " " & formattedLastName

# Nombre completo de ejemplo
let nombre = "juan"
let apellido = "pÉrez"

# Formatear el nombre completo
let nombreFormateado = formatFullName(nombre, apellido)

# Generar nombre de archivo aleatorio
let nombreArchivo = generateRandomFileName()

# Guardar el nombre formateado en el archivo
echo "Guardando nombre formateado: ", nombreFormateado
echo "Nombre del archivo: ", nombreArchivo

# Escribir en el archivo
writeFile(nombreArchivo, nombreFormateado)

echo "Archivo guardado exitosamente."
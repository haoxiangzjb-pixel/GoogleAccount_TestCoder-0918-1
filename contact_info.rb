# Hash con información de contacto
require 'json'
require 'securerandom'

contacto = {
  nombre: "Juan Pérez",
  email: "juan.perez@example.com",
  telefono: "+34 612 345 678",
  direccion: "Calle Mayor 123, Madrid",
  empresa: "Tech Solutions SL"
}

# Generar nombre de archivo aleatorio
nombre_archivo = "contacto_#{SecureRandom.hex(8)}.json"

# Guardar el hash en formato JSON
File.write(nombre_archivo, JSON.pretty_generate(contacto))

puts "Información de contacto guardada en: #{nombre_archivo}"
puts "Contenido:"
puts contacto.to_json

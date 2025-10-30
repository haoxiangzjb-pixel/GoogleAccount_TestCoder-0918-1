variable "numero_instancias" {
  description = "Número de instancias a crear"
  type        = number
  default     = 3
}

variable "nombres_instancias" {
  description = "Lista de nombres para las instancias"
  type        = list(string)
  default     = ["instancia-1", "instancia-2", "instancia-3"]
}

resource "null_resource" "instancia" {
  count = var.numero_instancias

  triggers = {
    nombre_instancia = var.nombres_instancias[count.index]
  }

  provisioner "local-exec" {
    command = "echo 'Creando instancia: ${var.nombres_instancias[count.index]}'"
  }
}

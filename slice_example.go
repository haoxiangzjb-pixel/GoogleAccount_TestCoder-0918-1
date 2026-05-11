package main

import (
"fmt"
"math/rand"
"os"
"time"
)

func main() {
// Inicializar la semilla aleatoria
rand.Seed(time.Now().UnixNano())

// Crear un slice vacío de enteros
var numbers []int

// Agregar elementos al slice usando append
numbers = append(numbers, 10)
numbers = append(numbers, 20)
numbers = append(numbers, 30)

// También se pueden agregar múltiples elementos a la vez
numbers = append(numbers, 40, 50, 60)

// O agregar otro slice usando el operador ...
moreNumbers := []int{70, 80, 90}
numbers = append(numbers, moreNumbers...)

fmt.Println("Slice completo:", numbers)
fmt.Println("Longitud del slice:", len(numbers))

// Generar un nombre de archivo aleatorio
randomName := fmt.Sprintf("slice_data_%d.txt", rand.Intn(100000))

// Convertir el slice a string para guardar en archivo
content := fmt.Sprintf("%v\n", numbers)

// Guardar el contenido en el archivo
err := os.WriteFile(randomName, []byte(content), 0644)
if err != nil {
fmt.Println("Error al escribir el archivo:", err)
return
}

fmt.Println("Datos guardados en el archivo:", randomName)
}

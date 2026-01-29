package main

import (
	"fmt"
)

func main() {
	// Crear un slice vacío
	var frutas []string

	// Agregar elementos al slice usando append
	frutas = append(frutas, "Manzana")
	frutas = append(frutas, "Banana")
	frutas = append(frutas, "Naranja")
	frutas = append(frutas, "Uva")

	// También se puede agregar múltiples elementos a la vez
	frutas = append(frutas, "Fresa", "Piña", "Sandía")

	// Imprimir el slice final
	fmt.Println("Slice de frutas:", frutas)
	fmt.Printf("Longitud del slice: %d\n", len(frutas))
	fmt.Printf("Capacidad del slice: %d\n", cap(frutas))

	// Iterar sobre los elementos
	fmt.Println("\nElementos del slice:")
	for i, fruta := range frutas {
		fmt.Printf("%d. %s\n", i, fruta)
	}
}

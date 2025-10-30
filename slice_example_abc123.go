package main

import "fmt"

func main() {
	// Crear un slice vacío
	mySlice := []int{}

	// Agregar elementos al slice
	mySlice = append(mySlice, 1)
	mySlice = append(mySlice, 2)
	mySlice = append(mySlice, 3)

	// Imprimir el slice resultante
	fmt.Println("Slice después de agregar elementos:", mySlice)

	// Agregar múltiples elementos a la vez
	mySlice = append(mySlice, 4, 5, 6)
	fmt.Println("Slice después de agregar múltiples elementos:", mySlice)
}
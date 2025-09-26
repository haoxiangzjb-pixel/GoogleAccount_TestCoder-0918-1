package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, World!")
}

func main() {
	http.HandleFunc("/", handler)
	port := "8080"
	fmt.Printf("Server starting on port %s\n", port)
	http.ListenAndServe(":"+port, nil)
}
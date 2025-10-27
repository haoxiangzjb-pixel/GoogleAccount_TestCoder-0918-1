package main

import (
    "fmt"
    "net/http"
    "log"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, World! This is a Go application running in a multi-stage Docker container.")
}

func main() {
    http.HandleFunc("/", handler)
    log.Println("Server starting on port 8080...")
    log.Fatal(http.ListenAndServe(":8080", nil))
}
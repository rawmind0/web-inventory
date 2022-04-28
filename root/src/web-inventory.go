package main

import (
    "encoding/json"
    "fmt"
    "net/http"
)

const (
    NAME = "inventory"
)

// VERSION gets overridden at build time using -X main.VERSION=$VERSION
var VERSION = "dev"

func inventoryHandler(w http.ResponseWriter, r *http.Request) {
    response := map[string]string{
        "service": NAME,
        "version": VERSION,
        "description": fmt.Sprintf("Microservice %s version %s", NAME, VERSION),
    }
    json.NewEncoder(w).Encode(response)
}

func main() {
	fmt.Printf("Starting microservice %s version %s\n", NAME, VERSION)
    http.HandleFunc("/", inventoryHandler)
    http.ListenAndServe(":8080", nil)
}

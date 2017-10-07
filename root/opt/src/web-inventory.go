package main

import (
    "fmt"
    "net/http"
    "os"
)

func inventoryHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Inventory microservice version", os.Getenv("SERVICE_VERSION"))
}

func main() {
	fmt.Println("Starting web-inventory version", os.Getenv("SERVICE_VERSION"))
    http.HandleFunc("/", inventoryHandler)
    http.ListenAndServe(":8080", nil)
}

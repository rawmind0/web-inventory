package main

import (
    "fmt"
    "net/http"
    "os"
)

func inventoryHandler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Inventory microservice version", os.Getenv("VERSION"))
}

func main() {
	fmt.Println("Starting web-inventory version", os.Getenv("VERSION"))
    http.HandleFunc("/", inventoryHandler)
    http.ListenAndServe(":8080", nil)
}

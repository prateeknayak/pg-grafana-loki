package main

import (
	"fmt"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	"log"
	"net/http"
)

func main() {
	http.Handle("metrics", promhttp.Handler())
	http.HandleFunc("/", helloWorld)
	fmt.Println("starting server at on port 8000")
	log.Fatal(http.ListenAndServe(":8000", nil))
}

func helloWorld(w http.ResponseWriter, r *http.Request) {
	_, err := fmt.Fprintf(w, "hello World !")

	if err != nil  {
		fmt.Printf("error returning reponse, %s", err.Error())
	}
}
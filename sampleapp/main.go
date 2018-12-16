package main

import (
	"fmt"
	"github.com/prometheus/client_golang/prometheus/promhttp"
	log "github.com/sirupsen/logrus"
	"net/http"
)

func main() {
	http.Handle("metrics", promhttp.Handler())
	http.HandleFunc("/", helloWorld)
	fmt.Println("starting server at on port 8000")
	log.Fatal(http.ListenAndServe(":8000", nil))
}

func helloWorld(w http.ResponseWriter, r *http.Request) {
	log.Info("info log statement from the hello world handler.")
	log.Error("error log statement from the hello world handler.")
	log.Debug("debug log statement from the hello world handler.")

	_, err := fmt.Fprintf(w, "hello World !")

	if err != nil  {
		log.Error("error returning reponse, %s", err.Error())
	}
}
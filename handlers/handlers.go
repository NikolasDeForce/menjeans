package handlers

import (
	"encoding/json"
	"fmt"
	"html/template"
	"io"
	"jeans/db"
	"jeans/jeans"
	"log"
	"net/http"
)

type NotAllowedHandler struct{}

var tmpl *template.Template

// ServeHTTP implements http.Handler.
func (h NotAllowedHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	MethodNotAllowedHandler(w, r)
}

// MethodNotAllowedHandler is executed when the HTTP method is incorrect
func MethodNotAllowedHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("Serving:", r.URL.Path, "from", r.Host, "with method")
	Body := "Method not allowed!\n"
	fmt.Fprintf(w, "%s", Body)
}

func init() {
	tmpl = template.Must(template.ParseGlob("templates/*.html"))
}

func MainHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("Main Handler Serving:", r.URL.Path, "from", r.Host, "with method", r.Method)
	w.WriteHeader(http.StatusOK)

	err := tmpl.ExecuteTemplate(w, "index.html", nil)
	if err != nil {
		fmt.Println(err)
	}
}

// MenJeansHandler is for getting all data for men from the jeans database
func MenJeansHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("MenJeansHandler Serving:", r.URL.Path, "from", r.Host)

	dates := db.ListAllMenJeans()

	data := jeans.Data{
		MenJeansData: dates,
	}

	err := tmpl.ExecuteTemplate(w, "menjeans.html", data)
	if err != nil {
		fmt.Println(err)
	}
}

// MenJeansHandler is for getting all data for women from the jeans database
func WomenJeansHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("WomenJeansHandler Serving:", r.URL.Path, "from", r.Host)

	dates := db.ListAllWomenJeans()

	data := jeans.Data{
		WomenJeansData: dates,
	}

	err := tmpl.ExecuteTemplate(w, "womenjeans.html", data)
	if err != nil {
		fmt.Println(err)
	}
}

// SliceToJSON encodes a slice with JSON records
func SliceToJSON(slice interface{}, w io.Writer) error {
	e := json.NewEncoder(w)
	return e.Encode(slice)
}

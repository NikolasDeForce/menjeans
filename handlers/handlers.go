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

	err := tmpl.ExecuteTemplate(w, "index.html", nil)
	if err != nil {
		fmt.Println(err)
	}
}

// GetAllHandler is for getting all data from the jeans database
func GetAllHandler(w http.ResponseWriter, r *http.Request) {
	log.Println("GetAllHandler Serving:", r.URL.Path, "from", r.Host)
	w.WriteHeader(http.StatusOK)

	dates := db.ListAllJeans()

	data := jeans.Data{
		JeansData: dates,
	}

	err := tmpl.ExecuteTemplate(w, "post.html", data)
	if err != nil {
		fmt.Println(err)
	}
}

// SliceToJSON encodes a slice with JSON records
func SliceToJSON(slice interface{}, w io.Writer) error {
	e := json.NewEncoder(w)
	return e.Encode(slice)
}

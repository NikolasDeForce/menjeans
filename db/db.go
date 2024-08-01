package db

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"io"
	"log"

	_ "github.com/lib/pq"
)

type Jeans struct {
	ID          int
	NameRu      string
	NameEng     string
	Discription string
	URL         string
}

// FromJSON decodes a serialized JSON record - Jeans{}
func (p *Jeans) FromJSON(r io.Reader) error {
	e := json.NewDecoder(r)
	return e.Decode(p)
}

// ToJSON encodes a Jeans JSON record
func (p *Jeans) ToJSON(w io.Writer) error {
	e := json.NewEncoder(w)
	return e.Encode(p)
}

// PostgreSQL connection details
var (
	Hostname = "localhost"
	Port     = 5432
	Username = "postgres"
	Password = "postgres"
	Database = "jeans_rest"
)

func ConnectPostgres() *sql.DB {
	conn := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		Hostname, Port, Username, Password, Database)

	db, err := sql.Open("postgres", conn)
	if err != nil {
		log.Println(err)
		return nil
	}

	return db
}

// ListAllJeans if for returning all jeans from the database table
func ListAllJeans() []Jeans {
	db := ConnectPostgres()
	if db == nil {
		log.Println("Cannot connect to PostreSQL!")
		db.Close()
		return []Jeans{}
	}
	defer db.Close()

	rows, err := db.Query("SELECT * FROM menjeans \n")
	if err != nil {
		log.Println(err)
		return []Jeans{}
	}

	all := []Jeans{}
	var c1 int
	var c2, c3, c4, c5 string

	for rows.Next() {
		err = rows.Scan(&c1, &c2, &c3, &c4, &c5)
		temp := Jeans{c1, c2, c3, c4, c5}
		all = append(all, temp)
	}

	return all
}

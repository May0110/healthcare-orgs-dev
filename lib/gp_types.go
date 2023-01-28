package lib

import (
	"encoding/xml"
	"fmt"
)

type Asutused struct {
	XMLName  xml.Name `xml:"asutused"`
	Asutused []Asutus `xml:"asutus"`
}

type Asutus struct {
	XMLName     xml.Name      `xml:"asutus"`
	Nimi        string        `xml:"nimi"`
	Kood        string        `xml:"registrikood"`
	Tootajad    []Tootajad    `xml:"tootajad"`
	Tegevusload []Tegevusload `xml:"tegevusload"`
}

type Tootajad struct {
	XMLName  xml.Name  `xml:"tootajad"`
	Tootajad []Tootaja `xml:"tootaja"`
}
type Tootaja struct {
	XMLName  xml.Name `xml:"tootaja"`
	Eesnimi  string   `xml:"eesnimi"`
	Perenimi string   `xml:"perenimi"`
	Kood     string   `xml:"kood"`
	Kutse    string   `xml:"kutse_nimi"`
}
type Tegevusload struct {
	XMLName     xml.Name      `xml:"tegevusload"`
	Tegevusload []Tegevusluba `xml:"tegevusluba"`
}
type Tegevusluba struct {
	XMLName      xml.Name `xml:"tegevusluba"`
	Number       string   `xml:"tegevusloa_number"`
	Alates       string   `xml:"alates"`
	Kuni         string   `xml:"kuni"`
	LoaliigiNimi string   `xml:"loaliik_nimi"`
}

func init() {
	fmt.Println("gplib initialized")
}

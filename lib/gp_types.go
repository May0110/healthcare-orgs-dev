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
	Aadress     string        `xml:"aadress"`
	Tootajad    []Tootajad    `xml:"tootajad"`
	Tegevusload []Tegevusload `xml:"tegevusload"`
	ID          int           `xml:"primary-key"`
}

type Nimistud struct {
	XMLName  xml.Name  `xml:"nimistud"`
	Nimistud []Nimistu `xml:"nimistu"`
}
type Nimistu struct {
	XMLName  xml.Name   `xml:"nimistu"`
	Kood     string     `xml:"kood"`
	Perearst Perearst   `xml:"perearst"`
	Tootajad []Tootajad `xml:"tootajad"`
}
type Perearst struct {
	XMLName  xml.Name `xml:"perearst"`
	Eesnimi  string   `xml:"eesnimi"`
	Perenimi string   `xml:"perenimi"`
	Kood     string   `xml:"kood"`
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
	Roll     string   `xml:"roll_nimi"`
	AsutusID int      `xml:"asutus_id"`
	ID       int      `xml:"primary-key"`
}
type Tegevusload struct {
	XMLName     xml.Name      `xml:"tegevusload"`
	Tegevusload []Tegevusluba `xml:"tegevusluba"`
}
type Tegevusluba struct {
	XMLName      xml.Name       `xml:"tegevusluba"`
	Number       string         `xml:"tegevusloa_number"`
	Alates       string         `xml:"alates"`
	Kuni         string         `xml:"kuni"`
	LoaliigiNimi string         `xml:"loaliik_nimi"`
	Tegevuskohad []Tegevuskohad `xml:"tegevuskohad"`
	AsutusID     int            `xml:"asutus_id"`
	ID           int            `xml:"primary-key"`
}
type Tegevuskohad struct {
	XMLName      xml.Name      `xml:"tegevuskohad"`
	Tegevuskohad []Tegevuskoht `xml:"tegevuskoht"`
}
type Tegevuskoht struct {
	XMLName       xml.Name `xml:"tegevuskoht"`
	Aadress       string   `xml:"aadress"`
	TegevuslubaID int      `xml:"tegevusluba_id"`
}

func init() {
	fmt.Println("gplib initialized")
}

package lib

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strings"
)

func FindGpPatientList(choice string) {

	fmt.Print("Otsi pererarsti nimistut => ")
	var keyword string
	fmt.Scanln(&keyword)

	xmlFile, err := os.Open("data/od_nimistud.xml")
	if err != nil {
		fmt.Println(err)
	}
	defer xmlFile.Close()
	byteValue, _ := ioutil.ReadAll(xmlFile)

	var nimistud Nimistud
	err = xml.Unmarshal(byteValue, &nimistud)
	if err != nil {
		fmt.Println(err)
	}

	for i := 0; i < len(nimistud.Nimistud); i++ {
		var nimistu Nimistu = nimistud.Nimistud[i]

		var ii int = strings.Index(strings.ToLower(nimistu.Perearst.Eesnimi), strings.ToLower(keyword))
		var jj int = strings.Index(strings.ToLower(nimistu.Perearst.Perenimi), strings.ToLower(keyword))

		// if keyword not found, continue..
		if ii < 0 && jj < 0 {
			continue
		}

		log.Printf("%d) %s %s (%s)\n", i+1, nimistu.Perearst.Eesnimi, nimistu.Perearst.Perenimi, nimistu.Kood)

		// if we don't want to print employees, continue..
		if choice != "20" {
			continue
		}

		var tootajaid int = len(nimistu.Tootajad[0].Tootajad)
		if tootajaid > 0 {
			log.Printf("    = = = TÖÖTAJAID (%d)", tootajaid)
		}
		for j := 0; j < tootajaid; j++ {
			tootaja := nimistu.Tootajad[0].Tootajad[j]
			log.Printf("    %d) %s %s (%s) | %s\n", j+1,
				tootaja.Eesnimi,
				tootaja.Perenimi,
				tootaja.Kood,
				tootaja.Roll)
		}
	}
}

func FindGpOffice(choice string) {

	fmt.Print("Otsi tervishoiuasutust => ")
	var keyword string
	fmt.Scanln(&keyword)

	xmlFile, err := os.Open("data/od_asutused.xml")
	if err != nil {
		fmt.Println(err)
	}
	defer xmlFile.Close()
	byteValue, _ := ioutil.ReadAll(xmlFile)

	var asutused Asutused
	err = xml.Unmarshal(byteValue, &asutused)
	if err != nil {
		fmt.Println(err)
	}

	for i := 0; i < len(asutused.Asutused); i++ {
		var asutus Asutus = asutused.Asutused[i]

		var ii int = strings.Index(strings.ToLower(asutus.Nimi), strings.ToLower(keyword))

		// if keyword not found, continue..
		if ii < 0 {
			continue
		}

		log.Printf("%d) %s (%s)\n", i+1, asutus.Nimi, asutus.Kood)

		// if we don't want to print employees, continue..
		if choice != "2" {
			continue
		}

		var tootajaid int = len(asutus.Tootajad[0].Tootajad)
		if tootajaid > 0 {
			log.Printf("    = = = TÖÖTAJAID (%d)", tootajaid)
		}
		for j := 0; j < tootajaid; j++ {
			tootaja := asutus.Tootajad[0].Tootajad[j]
			log.Printf("    %d) %s %s (%s) | %s\n", j+1,
				tootaja.Eesnimi,
				tootaja.Perenimi,
				tootaja.Kood,
				tootaja.Kutse)
		}

		var tegevuslube int = len(asutus.Tegevusload[0].Tegevusload)
		if tegevuslube > 0 {
			log.Printf("    = = = TEGEVUSLOAD (%d) = = =\n", tegevuslube)
		}
		for k := 0; k < tegevuslube; k++ {
			tl := asutus.Tegevusload[0].Tegevusload[k]
			log.Printf("    %d) %s %s (Alates: %s | Kuni: %s)\n",
				k+1,
				tl.Number,
				tl.LoaliigiNimi,
				tl.Alates,
				tl.Kuni)
		}
	}
}

func FindGpOfficeEmployee() {
	var empCount int = 0

	fmt.Print("Otsi tervishoiuasutuse töötajat => ")
	var keyword string
	fmt.Scanln(&keyword)

	xmlFile, err := os.Open("data/od_asutused.xml")
	if err != nil {
		fmt.Println(err)
	}
	defer xmlFile.Close()
	byteValue, _ := ioutil.ReadAll(xmlFile)

	var asutused Asutused
	err = xml.Unmarshal(byteValue, &asutused)
	if err != nil {
		fmt.Println(err)
	}

	for i := 0; i < len(asutused.Asutused); i++ {
		var asutus Asutus = asutused.Asutused[i]
		var tootajaid int = len(asutus.Tootajad[0].Tootajad)
		for j := 0; j < tootajaid; j++ {
			tootaja := asutus.Tootajad[0].Tootajad[j]

			var nn int = strings.Index(strings.ToLower(tootaja.Eesnimi), strings.ToLower(keyword))
			var mm int = strings.Index(strings.ToLower(tootaja.Perenimi), strings.ToLower(keyword))

			if nn >= 0 || mm >= 0 {
				empCount++
				log.Printf("    %d) %s %s (%s) | %s | %s\n", empCount,
					tootaja.Eesnimi,
					tootaja.Perenimi,
					tootaja.Kood,
					tootaja.Kutse,
					asutus.Nimi)
			}
		}
	}
}

func FindPatientListEmployee() {
	var empCount int = 0

	fmt.Print("Otsi pererarstinimistu töötajat => ")
	var keyword string
	fmt.Scanln(&keyword)

	xmlFile, err := os.Open("data/od_nimistud.xml")
	if err != nil {
		fmt.Println(err)
	}
	defer xmlFile.Close()
	byteValue, _ := ioutil.ReadAll(xmlFile)

	var nimistud Nimistud
	err = xml.Unmarshal(byteValue, &nimistud)
	if err != nil {
		fmt.Println(err)
	}

	for i := 0; i < len(nimistud.Nimistud); i++ {
		var nimistu Nimistu = nimistud.Nimistud[i]
		var tootajaid int = len(nimistu.Tootajad[0].Tootajad)
		for j := 0; j < tootajaid; j++ {
			tootaja := nimistu.Tootajad[0].Tootajad[j]

			var nn int = strings.Index(strings.ToLower(tootaja.Eesnimi), strings.ToLower(keyword))
			var mm int = strings.Index(strings.ToLower(tootaja.Perenimi), strings.ToLower(keyword))

			if nn >= 0 || mm >= 0 {
				empCount++
				perearst := nimistu.Perearst.Eesnimi + " " + nimistu.Perearst.Perenimi
				log.Printf("    %d) %s %s (%s) | %s | %s\n", empCount,
					tootaja.Eesnimi,
					tootaja.Perenimi,
					tootaja.Kood,
					tootaja.Roll,
					perearst)
			}
		}
	}
}

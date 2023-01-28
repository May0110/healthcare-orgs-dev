package lib

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strings"
)

func FindGpOffice(choice string) {

	fmt.Print("Otsi pererarstikeskust : ")
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

	fmt.Print("Otsi pererarstikeskuse töötajat : ")
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

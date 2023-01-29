package lib

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"log"
	"os"
)

func ImportHCOData(db *Database) {
	log.Printf("Starting with HCO data import...")
	var hcoCount int = 0
	var employeeCount int = 0

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

		return
	}

outer:
	for i := 0; i < len(asutused.Asutused); i++ {
		var asutus Asutus = asutused.Asutused[i]
		//log.Printf("%d) %s (%s)\n", i+1, asutus.Nimi, asutus.Kood)

		asutusID, err := InsertHealthcareOrganisation(db, asutus)
		if err != nil {
			return
		}

		hcoCount++

		var tootajaid int = len(asutus.Tootajad[0].Tootajad)
		if tootajaid > 0 {
			log.Printf("    = = = TÖÖTAJAID (%d)", tootajaid)
		}
		for j := 0; j < tootajaid; j++ {
			tootaja := asutus.Tootajad[0].Tootajad[j]
			tootaja.AsutusID = asutusID

			_, err = InsertEmployee(db, tootaja)

			if err != nil {
				break outer
			}

			employeeCount++
		}
	}

	log.Printf("HCO data import completed, %d HCO-s and %d employees imported!", hcoCount, employeeCount)
}

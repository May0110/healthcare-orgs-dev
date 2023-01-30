package lib

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"time"
)

func ImportHCOData(db *Database) {
	log.Printf("Starting with HCO data import...")

	time.Sleep(1 * time.Second)

	var hcoCount int = 0
	var employeeCount int = 0
	var licenseCount int = 0
	var licenseResidenceCount int = 0
	var licenseResidenceServiceCount int = 0

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

		asutusID, err := InsertHealthcareOrganisation(db, asutus)
		if err != nil {
			return
		}

		hcoCount++

		var tootajaid int = len(asutus.Tootajad[0].Tootajad)
		for j := 0; j < tootajaid; j++ {
			tootaja := asutus.Tootajad[0].Tootajad[j]
			tootaja.AsutusID = asutusID

			_, err = InsertEmployee(db, tootaja)

			if err != nil {
				break outer
			}

			employeeCount++
		}

		var tegevuslube int = len(asutus.Tegevusload[0].Tegevusload)
		for k := 0; k < tegevuslube; k++ {
			tl := asutus.Tegevusload[0].Tegevusload[k]
			tl.AsutusID = asutusID

			tegevuslubaID, err := InsertLicense(db, tl)

			if err != nil {
				break outer
			}

			licenseCount++

			var tegevuskohti int = len(tl.Tegevuskohad[0].Tegevuskohad)
			for kk := 0; kk < tegevuskohti; kk++ {
				tegevuskoht := tl.Tegevuskohad[0].Tegevuskohad[kk]
				tegevuskoht.TegevuslubaID = tegevuslubaID

				tegevuskohtID, err := InsertLicenseResidence(db, tegevuskoht)

				if err != nil {
					break outer
				}

				licenseResidenceCount++

				var teenuseid int = len(tegevuskoht.Teenused[0].Teenused)
				for mm := 0; mm < teenuseid; mm++ {
					teenus := tegevuskoht.Teenused[0].Teenused[mm]
					teenus.TegevuskohtID = tegevuskohtID

					_, err = InsertLicenseResidenceService(db, teenus)

					if err != nil {
						break outer
					}

					licenseResidenceServiceCount++
				}
			}
		}
	}

	log.Printf(
		"HCO data import completed: %d HCO-s, %d employees, %d licenses, %d residences and %d services imported!",
		hcoCount, employeeCount, licenseCount, licenseResidenceCount, licenseResidenceServiceCount)
}

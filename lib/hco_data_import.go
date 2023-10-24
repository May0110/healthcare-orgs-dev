package lib

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"os"
	"time"
)

var teenusedMap map[string]Teenus
var erialadMap map[string]Eriala

func ImportHCOData(db *Database) {
	Logger.Log(PRIORITY_HIGH, "Starting with HCO data import...")

	time.Sleep(1 * time.Second)

	var hcoCount int = 0
	var employeeCount int = 0
	var employeeProfessionCount int = 0
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

			tootajaID, err := InsertEmployee(db, tootaja)

			if err != nil {
				break outer
			}

			employeeCount++

			var erialasid int = len(tootaja.Erialad[0].Erialad)
			for mm := 0; mm < erialasid; mm++ {
				eriala := tootaja.Erialad[0].Erialad[mm]
				eriala.TootajaID = tootajaID
				eriala.ErialaID = erialadMap[eriala.Kood].ID

				_, err = InsertEmployeeProfession(db, eriala)

				if err != nil {
					break outer
				}

				employeeProfessionCount++
			}
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
					teenus.TeenusID = teenusedMap[teenus.Kood].ID

					// fmt.Printf("Teenus => kood %s, nimi: %s, teenusID: %d\n", teenus.Kood, teenus.Nimi, teenus.TeenusID)

					_, err = InsertLicenseResidenceService(db, teenus)

					if err != nil {
						break outer
					}

					licenseResidenceServiceCount++
				}
			}
		}
	}

	text := fmt.Sprintf(
		"HCO data import completed: %d HCO-s, %d employees, %d employee professions, %d licenses, %d residences and %d services imported!",
		hcoCount, employeeCount, employeeProfessionCount, licenseCount, licenseResidenceCount, licenseResidenceServiceCount)
	Logger.Log(PRIORITY_HIGH, text)
}

func ImportHCOProfessions(db *Database) {
	Logger.Log(PRIORITY_HIGH, "Starting with HCO professions import...")

	time.Sleep(1 * time.Second)

	// create a map of professions and keep it in memory
	erialadMap = make(map[string]Eriala)

	var recordCount int = 0

	xmlFile, err := os.Open("data/od_erialad.xml")
	if err != nil {
		fmt.Println(err)
	}
	defer xmlFile.Close()
	byteValue, _ := ioutil.ReadAll(xmlFile)

	var erialad Erialad
	err = xml.Unmarshal(byteValue, &erialad)
	if err != nil {
		fmt.Println(err)

		return
	}

	for i := 0; i < len(erialad.Erialad); i++ {
		var eriala Eriala = erialad.Erialad[i]

		id, err := InsertProfession(db, eriala)
		if err != nil {
			return
		}

		eriala.ID = id

		// add the profession to the map
		erialadMap[eriala.Kood] = eriala

		recordCount++
	}

	text := fmt.Sprintf("HCO import completed: %d professions imported!", recordCount)
	Logger.Log(PRIORITY_HIGH, text)
}

func ImportHCOServices(db *Database) {
	Logger.Log(PRIORITY_HIGH, "Starting with HCO services import...")

	time.Sleep(1 * time.Second)

	// create a map of services and keep it in memory
	teenusedMap = make(map[string]Teenus)

	var recordCount int = 0

	xmlFile, err := os.Open("data/od_teenused.xml")
	if err != nil {
		fmt.Println(err)
	}
	defer xmlFile.Close()
	byteValue, _ := ioutil.ReadAll(xmlFile)

	var teenused Teenused
	err = xml.Unmarshal(byteValue, &teenused)
	if err != nil {
		fmt.Println(err)

		return
	}

	for i := 0; i < len(teenused.Teenused); i++ {
		var teenus Teenus = teenused.Teenused[i]

		id, err := InsertService(db, teenus)
		if err != nil {
			return
		}

		teenus.ID = id

		// add the service to the map
		teenusedMap[teenus.Kood] = teenus

		// fmt.Printf("Add to MAP => kood %s, nimi: %s, teenusID: %d\n", teenus.Kood, teenus.Nimi, teenus.ID)

		recordCount++
	}

	text := fmt.Sprintf("HCO import completed: %d services imported!", recordCount)
	Logger.Log(PRIORITY_HIGH, text)
}

func Import(db *Database) {
	Logger.Log(PRIORITY_HIGH, "\n")

	ImportHCOProfessions(db)
	ImportHCOServices(db)
	ImportHCOData(db)

	Logger.Log(PRIORITY_HIGH, "\n")
}

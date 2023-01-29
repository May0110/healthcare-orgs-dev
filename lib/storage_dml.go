package lib

import (
	"fmt"
	"log"
)

func InsertHealthcareOrganisation(db *Database, asutus Asutus) (insertedRowID int, err error) {
	table_name := "hco_healthcare_organisation"

	var rawSQL string = fmt.Sprintf(
		"insert into %s "+
			"(name, code, address) "+
			" values "+
			"($1, $2, $3) RETURNING id",
		table_name)

	insertedRowID, err = db.Insert(rawSQL, asutus.Nimi, asutus.Kood, asutus.Aadress)

	if err != nil {
		err = fmt.Errorf("Unable to insert HCO => %s", err.Error())
		fmt.Printf("DB ERROR => %v", err)

		return 0, err
	} else {
		log.Printf("HCO no %d inserted", insertedRowID)
	}

	return
}

func InsertEmployee(db *Database, tootaja Tootaja) (insertedRowID int, err error) {
	table_name := "hco_employee"

	var rawSQL string = fmt.Sprintf(
		"insert into %s "+
			"(firstname, surname, code, hco_id) "+
			" values "+
			"($1, $2, $3, $4) RETURNING id",
		table_name)

	insertedRowID, err = db.Insert(rawSQL, tootaja.Eesnimi, tootaja.Perenimi, tootaja.Kood, tootaja.AsutusID)

	if err != nil {
		err = fmt.Errorf("Unable to insert employee => %s", err.Error())
		fmt.Printf("DB ERROR => %v", err)

		return 0, err
	} else {
		log.Printf("Employee no %d inserted", insertedRowID)
	}

	return
}

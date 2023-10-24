package lib

import (
	"fmt"
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
		err = fmt.Errorf("unable to insert into '%s' => %s", table_name, err.Error())
		fmt.Printf("DB ERROR => %v", err)

		return 0, err
	} else {
		text := fmt.Sprintf("Row no %d was inserted into '%s'", insertedRowID, table_name)
		Logger.Log(PRIORITY_NORMAL, text)
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
		err = fmt.Errorf("unable to insert into '%s' => %s", table_name, err.Error())
		fmt.Printf("DB ERROR => %v", err)

		return 0, err
	} else {
		text := fmt.Sprintf("Row no %d was inserted into '%s'", insertedRowID, table_name)
		Logger.Log(PRIORITY_NORMAL, text)
	}

	return
}

func InsertEmployeeProfession(db *Database, eriala Eriala) (insertedRowID int, err error) {
	table_name := "hco_employee_profession"

	var rawSQL string = fmt.Sprintf(
		"insert into %s "+
			"(hco_profession_id, hco_employee_id) "+
			" values "+
			"($1, $2) RETURNING id",
		table_name)

	insertedRowID, err = db.Insert(rawSQL, eriala.ErialaID, eriala.TootajaID)

	if err != nil {
		err = fmt.Errorf("unable to insert into '%s' => %s", table_name, err.Error())
		fmt.Printf("DB ERROR => %v", err)

		return 0, err
	} else {
		text := fmt.Sprintf("Row no %d was inserted into '%s'", insertedRowID, table_name)
		Logger.Log(PRIORITY_NORMAL, text)
	}

	return
}

func InsertLicense(db *Database, tegevusluba Tegevusluba) (insertedRowID int, err error) {
	table_name := "hco_license"

	var rawSQL string = fmt.Sprintf(
		"insert into %s "+
			"(code, license_type_name, hco_id) "+
			" values "+
			"($1, $2, $3) RETURNING id",
		table_name)

	insertedRowID, err = db.Insert(rawSQL, tegevusluba.Number, tegevusluba.LoaliigiNimi, tegevusluba.AsutusID)

	if err != nil {
		err = fmt.Errorf("unable to insert into '%s' => %s", table_name, err.Error())
		fmt.Printf("DB ERROR => %v", err)

		return 0, err
	} else {
		text := fmt.Sprintf("Row no %d was inserted into '%s'", insertedRowID, table_name)
		Logger.Log(PRIORITY_NORMAL, text)
	}

	return
}

func InsertLicenseResidence(db *Database, tk Tegevuskoht) (insertedRowID int, err error) {
	table_name := "hco_license_residence"

	var rawSQL string = fmt.Sprintf(
		"insert into %s "+
			"(hco_license_id, address) "+
			" values "+
			"($1, $2) RETURNING id",
		table_name)

	insertedRowID, err = db.Insert(rawSQL, tk.TegevuslubaID, tk.Aadress)

	if err != nil {
		err = fmt.Errorf("unable to insert into '%s' => %s", table_name, err.Error())
		fmt.Printf("DB ERROR => %v", err)

		return 0, err
	} else {
		text := fmt.Sprintf("Row no %d was inserted into '%s'", insertedRowID, table_name)
		Logger.Log(PRIORITY_NORMAL, text)
	}

	return
}

func InsertLicenseResidenceService(db *Database, teenus Teenus) (insertedRowID int, err error) {
	table_name := "hco_license_residence_service"

	var rawSQL string = fmt.Sprintf(
		"insert into %s "+
			"(hco_license_residence_id, hco_service_id) "+
			" values "+
			"($1, $2) RETURNING id",
		table_name)

	insertedRowID, err = db.Insert(rawSQL, teenus.TegevuskohtID, teenus.TeenusID)

	if err != nil {
		err = fmt.Errorf("unable to insert into '%s' => %s", table_name, err.Error())
		fmt.Printf("DB ERROR => %v", err)

		return 0, err
	} else {
		text := fmt.Sprintf("Row no %d was inserted into '%s'", insertedRowID, table_name)
		Logger.Log(PRIORITY_NORMAL, text)
	}

	return
}

func InsertProfession(db *Database, eriala Eriala) (insertedRowID int, err error) {
	table_name := "hco_profession"

	var rawSQL string = fmt.Sprintf(
		"insert into %s "+
			"(code, name) "+
			" values "+
			"($1, $2) RETURNING id",
		table_name)

	insertedRowID, err = db.Insert(rawSQL, eriala.Kood, eriala.Nimi)

	if err != nil {
		err = fmt.Errorf("unable to insert into '%s' => %s", table_name, err.Error())
		fmt.Printf("DB ERROR => %v", err)

		return 0, err
	} else {
		text := fmt.Sprintf("Row no %s was inserted into '%s'", eriala.Kood, table_name)
		Logger.Log(PRIORITY_NORMAL, text)
	}

	return
}

func InsertService(db *Database, teenus Teenus) (insertedRowID int, err error) {
	table_name := "hco_service"

	var rawSQL string = fmt.Sprintf(
		"insert into %s "+
			"(code, name) "+
			" values "+
			"($1, $2) RETURNING id",
		table_name)

	insertedRowID, err = db.Insert(rawSQL, teenus.Kood, teenus.Nimi)

	if err != nil {
		err = fmt.Errorf("unable to insert into '%s' => %s", table_name, err.Error())
		fmt.Printf("DB ERROR => %v", err)

		return 0, err
	} else {
		text := fmt.Sprintf("Row no %s was inserted into '%s'", teenus.Kood, table_name)
		Logger.Log(PRIORITY_NORMAL, text)
	}

	return
}

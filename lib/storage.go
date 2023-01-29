package lib

import (
	"log"
	"os"
)

// GetDBURL returns database connection string
func GetDBURL() string {
	if dbURL := os.Getenv("DATABASE_URL"); dbURL != "" {
		return dbURL
	}

	return "host=localhost user=jkarner dbname=mydb"
}

func CreateDatabaseTables(db *Database) (err error) {
	log.Printf("* * * * * * * * * * * * * * * * * * * * * * * *")
	log.Printf("Creating HCO database tables...")
	log.Printf("")

	err = CreateHealthcareOrganisation(db)
	if err != nil {
		return err
	}

	err = CreateHcoEmployee(db)
	if err != nil {
		return err
	}

	err = CreateHealthcareOrganisationLicense(db)

	log.Printf("")
	log.Printf("HCO database tables created!")
	log.Printf("* * * * * * * * * * * * * * * * * * * * * * * * ")

	return err
}

func DropDatabaseTables(db *Database) (err error) {
	log.Printf("* * * * * * * * * * * * * * * * * * * * * * * * \n")
	log.Printf("Dropping HCO database tables...")
	log.Printf("")

	err = DropHealthcareOrganisation(db)
	if err != nil {
		return err
	}

	err = DropHcoEmployee(db)
	if err != nil {
		return err
	}

	err = DropHealthcareOrganisationLicense(db)

	log.Printf("")
	log.Printf("HCO database tables dropped!\n")
	log.Printf("* * * * * * * * * * * * * * * * * * * * * * * * ")

	return err
}

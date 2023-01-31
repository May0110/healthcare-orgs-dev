package lib

import (
	"fmt"
	"log"
)

func doesTableExist(db *Database, tableName string) (response bool) {
	var rawSQL string = fmt.Sprintf("SELECT * FROM pg_catalog.pg_tables WHERE tablename = '%s'", tableName)

	rows, err := db.ExecuteQuery(rawSQL)
	defer rows.Close()

	if err != nil {
		log.Fatal(err)

		return false
	}

	if rows.Next() {
		return true
	} else {
		return false
	}
}

func countRows(db *Database, table string) (rowCount int, err error) {
	rowCount = 0

	var rawSQL string = fmt.Sprintf("SELECT count(*) FROM %s", table)

	rows, err := db.ExecuteQuery(rawSQL)
	defer rows.Close()

	if err != nil {
		log.Fatal(err)

		return 0, err
	}

	// go through the result set
	for rows.Next() {
		err = rows.Scan(&rowCount)

		if err != nil {
			log.Fatal(err)

			return 0, err
		}
	}

	return rowCount, nil
}

func displayTableStatistics(db *Database, tableName string) {
	var err error
	rowCount := 0
	tableExists := doesTableExist(db, tableName)

	if tableExists {
		rowCount, err = countRows(db, tableName)

		if err != nil {
			errText := fmt.Errorf("Unable to display table ('%s') statistics => %s", tableName, err.Error())
			fmt.Println(errText)

			return
		}
	}

	fmt.Printf("Table '%s' exists => %t | Row count : %d\n", tableName, tableExists, rowCount)

	return
}

func DisplayTableStatisticsComplete(db *Database) {
	fmt.Printf("\n")
	fmt.Printf("* * * * * * * * * * * * * * DATABASE STATISTICS * * * * * * * * * * * * * * \n")
	fmt.Printf("\n")
	displayTableStatistics(db, "hco_healthcare_organisation")
	displayTableStatistics(db, "hco_employee")
	displayTableStatistics(db, "hco_license_residence_service")
	displayTableStatistics(db, "hco_license_residence")
	displayTableStatistics(db, "hco_license")
	displayTableStatistics(db, "hco_service")
	displayTableStatistics(db, "hco_profession")
	fmt.Printf("\n")
	fmt.Printf("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n\n")

	return
}

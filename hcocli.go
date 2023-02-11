package main

import (
	"fmt"
	"log"

	"github.com/kjyrgen/gpcli/lib"
)

var db *lib.Database = nil
var dbInitialized bool = false

const DEFAULT_CHOICE string = "75"
const CHOICE_EXIT string = "0"

func initializeDatabaseConnection() (err error) {
	if dbInitialized {
		return
	}

	db, err = lib.InitDB(lib.GetDBURL())
	if err != nil {
		log.Printf("failed to initialize db connection: %s", err.Error())
		return err
	}

	dbInitialized = true

	return
}

func main() {
	var choice string = DEFAULT_CHOICE

	for choice != "0" {
		fmt.Println("= = = = = = = = = MAIN MENU = = = = = = = = = = = =")
		fmt.Println("")
		fmt.Println(" 0 => quit!\n")
		fmt.Println(" 1 => search for HCO (Health Care Organisation)")
		fmt.Println(" 2 => search for HCO (activity fields and employees are also displayed)")
		fmt.Println(" 3 => search for HCO employee")
		fmt.Println("")
		fmt.Println(" 10 => search for a General Practitioner (GP)")
		fmt.Println(" 20 => search for a General Practitioner (employees are also displayed)")
		fmt.Println(" 30 => search for a GP employee")
		fmt.Println("")
		fmt.Println(" 90 => create database tables")
		fmt.Println(" 91 => drop database tables")
		fmt.Println(" 92 => import healthcare data into the database")
		fmt.Println("")
		fmt.Println(" 99 => display database statistics")
		fmt.Println("")
		fmt.Println("= = = = = = = = = = = = = = = = = = = = = = = = = =\n")
		fmt.Print("Your choice => ")
		fmt.Scanln(&choice)

		// do we need database connection?
		if choice > DEFAULT_CHOICE {
			initializeDatabaseConnection()
		}

		if choice == "1" || choice == "2" {
			lib.FindGpOffice(choice)
		} else if choice == "3" {
			lib.FindGpOfficeEmployee()
		} else if choice == "10" || choice == "20" {
			lib.FindGpPatientList(choice)
		} else if choice == "30" {
			lib.FindPatientListEmployee()
		} else if choice == "90" {
			lib.CreateDatabaseTables(db)
		} else if choice == "91" {
			lib.DropDatabaseTables(db)
		} else if choice == "92" {
			lib.Import(db)
		} else if choice == "99" {
			lib.DisplayTableStatisticsComplete(db)
		} else if choice == CHOICE_EXIT {
			fmt.Printf("\nProgram shutdown. Good night :)\n\n")
		} else {
			if choice != DEFAULT_CHOICE {
				fmt.Printf("\n\nThe option \"%s\" does not exist in the menu. Please try again.\n\n", choice)
			}
		}

		if choice != CHOICE_EXIT {
			choice = DEFAULT_CHOICE
		}
	}
}

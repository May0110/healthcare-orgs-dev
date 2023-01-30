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
		fmt.Println("= = = = = = = = = = = = = = = = = = = = = = = = = =")
		fmt.Println("")
		fmt.Println(" 0 => välju!\n")
		fmt.Println(" 1 => otsi tervishoiuasutust")
		fmt.Println(" 2 => otsi tervishoiuasutust (kuvatakse ka tegevusalad ja töötajad)")
		fmt.Println(" 3 => otsi tervishoiuasutuse töötajat")
		fmt.Println("")
		fmt.Println(" 10 => otsi perearstinimistut")
		fmt.Println(" 20 => otsi perearstinimistut (kuvatakse ka töötajad)")
		fmt.Println(" 30 => otsi perearstinimistu töötajat")
		fmt.Println("")
		fmt.Println(" 90 => create database tables")
		fmt.Println(" 91 => drop database tables")
		fmt.Println(" 92 => import HCO data into database")
		fmt.Println("")
		fmt.Println("= = = = = = = = = = = = = = = = = = = = = = = = = =\n")
		fmt.Print("Tee valik => ")
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
		} else if choice == CHOICE_EXIT {
			fmt.Printf("\nProgramm sulgub! Head päeva :)\n\n")
		} else {
			if choice != DEFAULT_CHOICE {
				fmt.Printf("\n\nValik \"%s\" puudub, palun vali uuesti..\n\n", choice)
			}
		}

		if choice != CHOICE_EXIT {
			choice = DEFAULT_CHOICE
		}
	}
}

package main

import (
	"fmt"
	"log"

	"github.com/kjyrgen/gpcli/lib"
)

func main() {
	var choice string = "999"

	for choice != "0" {
		fmt.Println("= = = = = = = = = = = = = = = = = = = = = = = = = =")
		fmt.Println("")
		fmt.Println(" 0 => välju!\n")
		fmt.Println(" 1 => otsi perearstikeskust")
		fmt.Println(" 2 => otsi perearstikeskust (kuvatakse ka tegevusalad ja töötajad)")
		fmt.Println(" 3 => otsi perearstikeskuse töötajat")
		fmt.Println("")
		fmt.Println("= = = = = = = = = = = = = = = = = = = = = = = = = =\n")
		fmt.Print("Tee valik => ")
		fmt.Scanln(&choice)

		if choice == "1" || choice == "2" {
			lib.FindGpOffice(choice)
		} else if choice == "3" {
			lib.FindGpOfficeEmployee()
		} else if choice == "0" {
			fmt.Println("\nProgramm sulgub! Head päeva :)\n")
		} else {
			log.Printf("\n\nValik \"%s\" puudub, palun vali uuesti..\n\n", choice)
		}
	}

}

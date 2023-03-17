# Healthcare organisations command line client
---------------------------------------

  * [Intro](#intro)
  * [Requirements](#requirements)
  * [Usage](#usage)
    * [Option '1' : display full list of cars](display-full-list-of-cars) 
    * [Option '2' : search cars](search-cars) 
    * [Option '3' : display car statistics](display-car-statistics) 
  * [Data Model](#data-model)
  * [License](#license)

---------------------------------------

## Intro

It is a command line client, implemented in Golang, enabling to process and extract statistics about car models produced in USA, Japan and Europe between 1978 and 1982, visualising some interesting trends. The origin of the data is [data.world](https://data.world/dataman-udit/cars-data) website.

## Requirements

Go 1.18 or higher

## Usage

To run the command line client

```
go run hcocli.go  
```

It displays a menu and waits for your choice of action 

```
= = = = = = = = = MAIN MENU = = = = = = = = = = = =

 0 => quit!

 1 => search for HCO (Health Care Organisation)
 2 => search for HCO (activity fields and employees are also displayed)
 3 => search for HCO employee

 10 => search for a General Practitioner (GP)
 20 => search for a General Practitioner (employees are also displayed)
 30 => search for a GP employee

 90 => create database tables
 91 => drop database tables
 92 => import healthcare data into the database

 99 => display database statistics

= = = = = = = = = = = = = = = = = = = = = = = = = =

Your choice => 

```
### Option '90' : display full list of cars

Prints out the entire database of car models. At the time of writing, ca 400 items.

### Option '91' : search cars

You can search specific cars by name (e.g. Ford), model (e.g. Ranger) or country of origin (USA, Japan, Europe).

### Option '92' : display car statistics

The option generates 7 different bar charts and opens them on your default browser. 

p.s. if, for some reason, it does not open the browser, the generated file is located on "./temp/bar.html"

## Data model

![Data Model](/data/data-model.png "Data model")

## License

[MIT](https://opensource.org/license/mit/)

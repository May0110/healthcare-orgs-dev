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
### Options '1' to '30'

Searching health care organisations or employees.

### Option '90' : create database tables

Prints out the entire database of car models. At the time of writing, ca 400 items.

### Option '91' : drop database tables

You can search specific cars by name (e.g. Ford), model (e.g. Ranger) or country of origin (USA, Japan, Europe).

### Option '92' : import healthcare data into the database

The option generates 7 different bar charts and opens them on your default browser. 

p.s. if, for some reason, it does not open the browser, the generated file is located on "./temp/bar.html"

### Option '99' : display database statistics

The option generates 7 different bar charts and opens them on your default browser. 

p.s. if, for some reason, it does not open the browser, the generated file is located on "./temp/bar.html"

```
* * * * * * * * * * * * * * DATABASE STATISTICS * * * * * * * * * * * * * * 

Table 'hco_healthcare_organisation' exists => true | Row count : 1649
Table 'hco_employee' exists => true | Row count : 968
Table 'hco_employee_profession' exists => true | Row count : 730
Table 'hco_license_residence_service' exists => true | Row count : 4812
Table 'hco_license_residence' exists => true | Row count : 3352
Table 'hco_license' exists => true | Row count : 2638
Table 'hco_service' exists => true | Row count : 247
Table 'hco_profession' exists => true | Row count : 65

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
```


## Data model

![Data Model](/data/data-model.png "Data model")

## License

[MIT](https://opensource.org/license/mit/)

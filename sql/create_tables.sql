--CREATE TABEL KÄSK --
--I - ALEXI KURSUS --
CREATE TABLE EmployeeDemographics
(EmployeeID int,
FirstName varchar (50),
LastName varchar(50),
Age int,
Gender varchar(50)
)

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar (50),
Salary int)
--SQL - Cntr+Shift R -> kaovad teksti punased jooned ja
näeb välja kui tabel)--

--INSERT INTO table käsk--
INSERT INTO EmployeeDemographics VALUES
1002,'Pam', 'Beasley', 30, 'Female',
1003,'Dwight', 'Shcrute', 29, 'Male',

INSERT INTO EmployeeSalary VALUES
(1001, 'Salesman', 45000)


--POSTGRE CREATE TABEL  --

NB! The structure of the new table is defined by its table schema,
which defines a series of columns. Each column has a name,
the type of data allowed in that column, an optional table
constraint on values being inserted, and an optional default value.

-- Schema
CREATE TABLE IF NOT EXISTS table_name
(column DataType TableConstraint DEFAULT default_value,
another_column DataType TableConstraint DEFAULT default_value,..);
---
Movies table schema
CREATE TABLE movies (
    id INTEGER PRIMARY KEY,
    title TEXT,
    director TEXT,
    year INTEGER,
    length_minutes INTEGER
);

16.1 Create a new table named Database with the following columns:
– Name A string (text) describing the name of the database
– Version A number (floating point) of the latest version of this database
– Download_count An integer count of the number of times this database was downloaded
This table has no constraints.

CREATE TABLE database
  (name TEXT,
  version FLOAT,
  Download_count INTEGER);



--ALTER table---

ALTER TABLE statement to add, remove,
or modify columns and table constraints.

--ADDING columns
In some databases like MySQL, you can even specify where to insert
the new column using the FIRST or AFTER clauses,
though this is not a standard feature.

ALTER TABLE table_name
ADD column DataType optionaltableconstraint
  DEFAULT default_value

--REMOVING columns
NB! some databases (including SQLite) don't support this feature.
Instead you may have to create a new table and migrate the data over.

ALTER TABLE table_name
DROP column_to_be_deleted;

-- RENAMING the table

ALTER TABLE table_name
RENAME TO new_table_name

17.1 Add a column named Aspect_ratio with a FLOAT data type
to store the aspect-ratio each movie was released in.

ALTER TABLE Movies
ADD COLUMN Aspect_ratio FLOAT DEFAULT 2.39; ?????

17.2 Add another column named Language with a TEXT data type to
store the language that the movie was released in. Ensure that
the default for this language is English.

ALTER TABLE MOVIES
ADD COLUMN Language TEXT DEFAULT English;

Õige:
ALTER TABLE Movies
  ADD COLUMN Language TEXT DEFAULT "English";

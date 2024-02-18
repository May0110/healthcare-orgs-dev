--- HARJUTUS 6 ---
6.1 --Find the domestic and international sales for each movie

SELECT title, Domestic_sales, International sales
FROM boxoffice
  INNER JOIN movies ON boxoffice movie_id = movies.id;
Õige: ???
SELECT title, domestic_sales, international_sales
FROM movies
  JOIN boxoffice ON movies.id = boxoffice.movie_id;

  6.2 --Show the sales numbers for each movie that did better
   --internationally rather than domestically
   Õige + lisasin ise ORDER BY, aga ikkagi on minu meelest MASTER table Boxoffice

   SELECT title, international_sales
   FROM movies
    INNER JOIN boxoffice ON  movies.id = boxoffice.movie_id;
    WHERE international_sales > domestic sales
    ORDER BY international_sales ASC;

  6.3 --List all the movies by their ratings in descending order --

   SELECT title, rating
   FROM movies
    INNER JOIN boxoffice ON  movies.id = boxoffice.movie_id;
    ORDER BY ratings DESC;

   -- HARJUTUS 7 --

   7.1 --Find the list of all buildings that have employees
   SELECT building, name
   FROM employees
    LEFT JOIN buildings ON employees.building = building_name;

    Õige: ? - 1 x kirjed
    SELECT DISTINCT building FROM employees;

    7.2 -- Find the list of all buildings and their capacity
    SELECT * FROM buildings;

    7.3 --List all buildings and the distinct employee roles
    --in each building (including empty buildings)
    SELECT DISTINCT role, building
    FROM employees;

    Õige:
    SELECT DISTINCT building_name, role
    FROM buildings
      LEFT JOIN employees
      ON building_name = building;

      -- HARJUTUS 8 NULL VALUES --
    8.1 -- Find the name and role of all employees who have
     --not been assigned to a building
       SELECT name, role
       FROM employees
       WHERE building IS NULL;

    8.2 -- Find the names of the buildings that hold no employees
    SELECT building_name, name
    FROM buildings
      LEFT JOIN employees
      ON building_name = building
      WHERE name IS NULL;

    9. --Q with expressions --
    9.1 -- List all movies and their combined sales in millions of dollars
SELECT title, SUM (domestic_sales + international_sales) AS gross_sales_millions
FROM movies
INNER JOIN boxoffice ON movies.id = Boxoffice.movie_id;

Õige:
SELECT title, (domestic_sales + international_sales) / 1000000 AS gross_sales_millions
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

    9.2 --List all movies and their ratings in percent
    SELECT title, rating
    FROM movies
    JOIN boxoffice
      ON movies.id = boxoffice.movie_id;

      Õige: SELECT title, rating * 10 AS rating_percent
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

    9.3 -- List all movies that were released on even number year
    SELECT title,year
    FROM movies; EI OSKA
    Õige:
    SELECT title, year
    FROM movies
    WHERE year % 2 = 0; matemaatiline tehe nim jagamis jääk

10. --HARJUTUS Q w aggregates
10.1 --Find the longest time that an employee has been at the studio EI OSANUD
SELECT MAX(years_employed) as Max_years_employed
FROM employees;

10.2 --For each role, find the average number of years
--employed by employees in that role--
SELECT role, AVG(years_employed) AS AVG_years_employed
FROM employees
WHERE role LIKE "Engineer"
WHERE role LIKE "Artist"; ???? kui küsitakse ainult nende 2 rolli kohta

Õige:
SELECT role, AVG(years_employed) as Average_years_employed
FROM employees
GROUP BY role;

10.3 Find the total number of employee years worked in each building
SELECT building, SUM(years_employed) AS years_employed
FROM employees
GROUP BY building;

--harjutus 1--
1.1 Find the title of each film
SELECT title
FROM movies
ORDER BY title ASC;

1.2 Find the director of each film
SELECT director (title)
FROM movies
ORDER BY director ASC;

1.3 Find the title and director of each film
SELECT title, director
FROM movies
ORDER BY title ASC;

1.4 Find the title and year of each film
SELECT title, year
FROM movies;

1.5 Find all the information about each film
SELECT *
FROM movies;

--harjutus 2 Q & Con --
2.1 Find the movie with a row id of 6
SELECT *
FROM moviesSELECT city, country, population FROM north_american_cities
WHERE country LIKE "%United%"
ORDER BY population DESC
LIMIT 2 OFFSET 2;
WHERE id = 6;

2.2 Find the movies released in the years between 2000 and 2010 ✓
SELECT *
FROM movies
WHERE YEAR BETWEEN 2000 AND 2010;
[ÕIGE]????:
SELECT title, year
FROM movies
WHERE year BETWEEN 2000 AND 2010;

2.3 Find the movies not released in the years between 2000 and 2010
SELECT *
FROM movies
WHERE YEAR NOT BETWEEN 2000 AND 2010;

2.4 Find the first 5 Pixar movies and their release year - tegin valesti, aga veits imelik
SELECT year, title
FROM movies
WHERE year <= 2003;

--Harjutus 3 Q & Con --
3.1 Find all the Toy Story movies
SELECT *
FROM movies
WHERE title LIKE '%Toy story%';

3.2 Find all the movies directed by John Lasseter
SELECT *
FROM movies
WHERE director = John Lasseter; ???
--Õige--
SELECT *
FROM movies
WHERE director LIKE '%John Lasseter%';

3.3 Find all the movies (and director) not directed by John Lasseter
SELECT *
FROM movies
WHERE director NOT LIKE "John Lasseter";
3.4 Find all the WALL-* movies
SELECT *
FROM movies
WHERE title LIKE '%WALL%'; ?? aga siin peaks sobima ka 'WALL%'

-- Harjutus 4. Filtering and sorting --
4.1 List all directors of Pixar movies (alphabetically), without duplicates
---Viga: unustasin DISTINCTi ----
SELECT DISTINCT director
FROM movies
ORDER BY director ASC;

4.2 List the last four Pixar movies released (ordered from most recent to least)
SELECT *
FROM movies
ORDERED BY year DESC
LIMIT 4;

4.3 List the first five Pixar movies sorted alphabetically
SELECT *
FROM movies
ORDERED BY year DESC
LIMIT 4;
4.4 List the first five Pixar movies sorted alphabetically
SELECT * --? kas ikka on viga Töövihik loeb õigeks: SELECT title
FROM movies
ORDERED BY title ASC
LIMIT 5;
4.5 List the next five Pixar movies sorted alphabetically ✓
SELECT title FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;
5. Simple SELECT queries
5.1 List all the Canadian cities and their populations
SELECT city, population, country
FROM north_american_cities
WHERE country = Canada; ???
Õige:
SELECT city,population,country
FROM north_american_cities
WHERE country LIKE '%Canada%';
5.2 Order all the cities in the United States by their latitude from north to south
SELECT city, country, latitude
FROM north_american_cities
WHERE country = United States
ORDER BY latitude DESC;
5.3 List all the cities west of Chicago, ordered from west to east
SELECT city, longitude
FROM north_american_cities
WHERE longitude < -87.629798 (Chicago - aga kuidas liikumine on )
ORDER BY longitude ASC;
5.4 List the two largest cities in Mexico (by population)
SELECT city,country,population
FROM north_american_cities
WHERE country = Mexico
LIMIT 2;
--Õige jälle % ja unustasin ORDER BY
SELECT city, population
FROM north_american_cities
WHERE country LIKE "Mexico"
ORDER BY population DESC
LIMIT 2;
5.5. List the third and fourth largest cities (by population) in
the United States and their population [Chicago & Houston]
SELECT city, country, population
FROM north_american_cities
WHERE country LIKE "United States"
ORDER by population
LIMIT 2 OFFSET 2;
SELECT city, country, population FROM north_american_cities
WHERE country LIKE "%United%"
ORDER BY population DESC
LIMIT 2 OFFSET 2;

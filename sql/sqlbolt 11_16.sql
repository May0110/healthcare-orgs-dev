11 --Q with aggregates GROUP BY, HAVING
11.1 Find the number of Artists in the studio (without a HAVING clause)
SELECT role
FROM employees
Where role = 'artist';
--õige--
SELECT role, COUNT(*) as Number_of_artists ?????
FROM employees
WHERE role = "Artist";

11.2 Find the number of Employees of each role in the studio
SELECT role, COUNT(*) as Number_of_employees
FROM employees
Group by role;

11.3 Find the total number of years employed by all Engineers
SELECT role,years_employed SUM (years_employed)
FROM employees
ORDER BY SUM (role);
--õige --
SELECT role, SUM(years_employed)
FROM employees
GROUP BY role
HAVING role = "Engineer";

--ORDER OF EXECUTION OF A QUERY --

12.1 Find the number of movies each director has directed
SELECT director COUNT (id) as num_movies_directed
FROM MOVIES
GROUP BY director

12.2 Find the total domestic and international sales
that can be attributed to each director
SELECT director COUNT (domestic_sales, international sales) as total_sales
FROM MOVIES
  INNER JOIN boxoffice ON movies_id = boxoffice.movies_id
  GROUP BY director;

  --Õige--
SELECT director, SUM(domestic_sales + international_sales) as Cumulative_sales_from_all_movies
FROM movies
    INNER JOIN boxoffice
        ON movies.id = boxoffice.movie_id
GROUP BY director;

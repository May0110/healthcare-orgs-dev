--INSERT ---
--ALEX COURSE --







--SCHEMA 1. In general, each row of data you insert should contain values
--for every corresponding column in the table. You can insert multiple rows
--at a time by just listing them sequentially.:--
INSERT INTO table_name
VALUES (value_or_expr, another_value_or_expr, ....),
      (value_or_expr2, another_value_or_expr2, ....);

--SCHEMA 2. In some cases, if you have incomplete data and the table
--contains columns that support default values, you can insert rows
--with only the columns of data you have by specifying them explicitly.

INSERT INTO table_name
(COLUMN, ANOTHER_COLUMN, ...)
VALUES (value_or_expr, another_value_or_expr, ....),
       (value_or_expr2, another_value_or_expr2, ....);

--I n addition, you can use mathematical and string expressions
--with the values that you are inserting.
--This can be useful to ensure that all data inserted is formatted
--a certain way.

INSERT INTO boxoffice
(MOVIE_ID, RATING, sales_in_millions)
VALUES (1, 9.9, 283742034 / 1000000);

--13.1 Add the studio's new production, Toy Story 4 to the list of movies
--(you can use any director)

INSERT INTO movies
(id,title, director, year, lenght_minutes)
VALUES (15,Toy Story 4, John Lasseter, 1999, 50);

SQLBOLT :
INSERT INTO movies VALUES (4, "Toy Story 4", "El Directore", 2015, 90);????

13.2 --Toy Story 4 has been released to critical acclaim!
--It had a rating of 8.7, and made 340 million domestically and
--270 million internationally. Add the record to the BoxOffice table.

INSERT INTO boxoffice
(MOVIE_ID, RATING, domestic_sales, International_sales)
VALUES (4, 8.7, 340000000, 270000000);

SQLBOLT: INSERT INTO boxoffice VALUES (4, 8.7, 340000000, 270000000);

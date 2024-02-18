--  A common task is to update existing data, which can be done using
--an UPDATE statement. Similar to the INSERT statement,
--you have to specify exactly which table, columns, and rows to update.
--In addition, the data you are updating has to match the data type of
--the columns in the table schema.

UPDATE table_name
SET column = value or expr,
    other_column = another_value_or_expr !!! ilma komata viimane
    ..
WHERE condition;

---NB !!! Most people working with SQL will make mistakes updating data
--at one point or another. Whether it's updating the wrong set of rows in a
--production database, or accidentally leaving out the WHERE clause
--(which causes the update to apply to all rows), you need to be extra careful
--when constructing UPDATE statements.
--One helpful tip is to always write the constraint first and
--test it in a SELECT query to make sure you are updating the right rows,
--and only then writing the column/value pairs to update.

14.1 The director for A Bug's Life is incorrect, it was actually
--directed by John Lasseter

UPDATE movies
SET director = 'John Lasseter'
WHERE id = 2;

14.2 The year that Toy Story 2 was released is incorrect,
it was actually released in 1999

UPDATE movies
SET year = 1999
WHERE id = 3;

14.3 Both the title and director for Toy Story 8 is incorrect!
The title should be "Toy Story 3" and it was directed by Lee Unkrich


UPDATE movies
SET title = 'Toy Story 3',
  director = ' Lee Unkrich'
WHERE id = 11;

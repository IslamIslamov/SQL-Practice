-- FIRST SESSION
 BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SECOND SESSION
 BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- FIRST SESSION
SELECT SUM(rating) FROM pizzeria;
-- SECOND SESSION
UPDATE pizzeria SET rating = 5.0 WHERE name = 'Pizza Hut';
COMMIT;


-- FIRST SESSION
SELECT SUM(rating) FROM pizzeria;
COMMIT;

------------------------------------

-- FIRST SESSION
SELECT SUM(rating) FROM pizzeria;
-- SECOND SESSION
SELECT SUM(rating) FROM pizzeria;

-- since this pattern is in an isolated layer, we will not know that the data has been changed until the transaction is verified, in this example it can be seen that session 1 will encounter a data change after the transaction is completed.

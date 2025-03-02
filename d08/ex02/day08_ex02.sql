-- FIRST SESSION 
-- start transaction with level 'REPEATABLE READ'
BEGIN ISOLATION LEVEL REPEATABLE READ;
-- start transaction with level 'REPEATABLE READ'
-- SECOND SESSION 
BEGIN ISOLATION LEVEL REPEATABLE READ;


-- FIRST SESSION
-- check data
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- SECOND SESSION 
-- check data
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';


-- FIRST SESSION
-- update data (rating = 4)
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- SECOND SESSION
-- attempt updating data of rating ('ERROR:  could not serialize access due to concurrent update')
-- it error is show because 1 session was not commited
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';


-- FIRST SESSION
-- success commit
COMMIT;
-- SECOND SESSION
-- ROLLBACK ('all changes in this transaction don`t save')
COMMIT;


-- FIRST SESSION
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- SECOND SESSION
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
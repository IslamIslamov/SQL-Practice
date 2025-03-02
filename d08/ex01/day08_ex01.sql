-- SHOW TRANSACTION ISOLATION LEVEL;

-- FIRST SESSION
BEGIN; -- start transaction

-- SECOND SESSION 
BEGIN;

-- FIRST SESSION
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- SECOND SESSION 
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- FIRST SESSION 
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

-- SECOND SESSION - wait first session
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- FIRST SESSION 
COMMIT;

-- second session update data now and data first session dont save

-- SECOND SESSION 
COMMIT;

-- in db saved 3.6

-- FIRST SESSION 
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- SECOND SESSION
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';


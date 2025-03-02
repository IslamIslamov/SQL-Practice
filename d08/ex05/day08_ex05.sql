-- FIRST SESSION
BEGIN;
-- SECOND SESSION
BEGIN;

-- FIRST SESSION
SELECT SUM(rating) FROM pizzeria;
-- SECOND SESSION
UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut';
COMMIT;


-- FIRST SESSION
SELECT SUM(rating) FROM pizzeria;
COMMIT;

------------------------------------

-- FIRST SESSION
SELECT SUM(rating) FROM pizzeria;
-- SECOND SESSION
SELECT SUM(rating) FROM pizzeria;


-- result for first session after transaction will be difference of second session because 'phantom reads' patterns has the same principle as the method 'Non-Repeatable Reads' 
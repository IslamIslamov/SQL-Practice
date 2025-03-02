-- FIRST SESSION
BEGIN;
-- SECOND SESSION
BEGIN;


-- FIRST SESSION
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- SECOND SESSION
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- FIRST SESSION
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
------------------------------------
-- FIRST SESSION
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- SECOND SESSION
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';


-- Transaction 1 starts and reads a row from the database.
-- Before transaction 1 completes, transaction 2 starts and updates or -deletes the same row that transaction 1 read, and then commits the changes.
-- Transaction 1 re-reads the same row and finds a value different from
-- the one it read the first time, due to an update or deletion made by transaction 2.
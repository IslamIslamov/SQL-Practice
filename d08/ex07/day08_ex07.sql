-- FIRST SESSION
BEGIN;
-- SECOND SESSION
BEGIN;

-- FIRST SESSION
UPDATE pizzeria SET rating = 3.0 WHERE id = 1;

-- SECOND SESSION
UPDATE pizzeria SET rating = 2.0 WHERE id = 2;

-- FIRST SESSION
UPDATE pizzeria SET rating = 4.0 WHERE id = 2;

-- SECOND SESSION
UPDATE pizzeria SET rating = 5.0 WHERE id = 1;

-- FIRST SESSION
COMMIT;
-- SECOND SESSION
COMMIT;

-- due to the fact that 2 sessions change the data of the same criteria and thus expect each other, a 'deadlock' is created, in my case, the rating value of two was changed, in accordance with the one entered by the first session
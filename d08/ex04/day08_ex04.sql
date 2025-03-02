-- FIRST SESSION
 BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- SECOND SESSION
 BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;


-- FIRST SESSION
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- SECOND SESSION
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;

-- FIRST SESSION
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
------------------------------------
-- FIRST SESSION
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
-- SECOND SESSION
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Unlike the previous pattern, this one completely isolates transactions, 1 session will not know about the data change until it completes its transaction
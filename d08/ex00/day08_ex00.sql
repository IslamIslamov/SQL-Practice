-- FIRST SESSION:
BEGIN;

UPDATE pizzeria 
	SET rating = 5.0
 	WHERE name = 'Pizza Hut';

-- SECOND SESSION: check datas in DB
SELECT * FROM pizzeria;

-- FIRST SESSION:
COMMIT;

-- SECOND SESSION: Check data
-- after commiting data were updated
SELECT * FROM pizzeria;
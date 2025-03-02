CREATE UNIQUE INDEX idx_person_discounts_unique
	ON person_discounts(person_id, pizzeria_id)

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE
SELECT 
	person_id,
	pizzeria_id
	FROM person_discounts

INSERT INTO
      person_discounts (id, person_id, pizzeria_id, discount)
VALUES
      (14, 1, 1, 22);

SET ENABLE_SEQSCAN TO ON;
SET 
  ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE 
SELECT 
  m.pizza_name, 
  pz.name AS pizzeria_name 
FROM 
  pizzeria AS pz 
  JOIN menu AS m ON pz.id = m.pizzeria_id 
SET 
  ENABLE_SEQSCAN TO ON;

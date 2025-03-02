WITH temp AS (
  SELECT 
    po.person_id 
  FROM 
    person_order AS po 
    JOIN menu AS m ON po.menu_id = m.id 
  WHERE 
    m.pizza_name IN (
      'pepperoni pizza', 'cheese pizza'
    ) 
  GROUP BY 
    po.person_id 
  HAVING 
    COUNT(DISTINCT m.pizza_name) = 2
) 
SELECT 
  p.name 
FROM 
  person AS p 
WHERE 
  p.gender = 'female' 
  AND p.id IN (
    SELECT 
      person_id 
    FROM 
      temp
  ) 
ORDER BY 
  p.name;

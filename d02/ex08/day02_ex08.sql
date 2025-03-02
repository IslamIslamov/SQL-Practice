SELECT 
  p.name 
FROM 
  person AS p 
  INNER JOIN person_order AS po ON p.id = po.person_id 
  INNER JOIN menu AS m ON m.id = po.menu_id 
WHERE 
  p.gender = 'male' 
  AND p.address IN ('Moscow', 'Samara') 
  AND m.pizza_name IN (
    'pepperoni pizza', 'mushroom pizza'
  ) 
ORDER BY 
  p.name DESC

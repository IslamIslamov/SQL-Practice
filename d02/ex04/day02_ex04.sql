SELECT 
  m.pizza_name, 
  pz.name AS pizzeria_name, 
  m.price 
FROM 
  menu AS m 
  JOIN pizzeria AS pz ON pz.id = m.pizzeria_id 
WHERE 
  m.pizza_name = 'mushroom pizza' 
  OR m.pizza_name = 'pepperoni pizza' 
ORDER BY 
  m.pizza_name ASC, 
  pizzeria_name ASC

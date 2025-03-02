SELECT 
  m.pizza_name, 
  pz.name AS pizzeria_name 
FROM 
  person AS p 
  INNER JOIN person_order AS po ON p.id = po.person_id 
  INNER JOIN menu AS m ON m.id = po.menu_id 
  INNER JOIN pizzeria AS pz ON pz.id = m.pizzeria_id 
WHERE 
  p.name IN ('Denis', 'Anna') 
ORDER BY 
  m.pizza_name ASC, 
  pz.name ASC

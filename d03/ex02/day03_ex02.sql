SELECT 
  m.pizza_name AS pizza_name, 
  m.price, 
  pz.name AS pizzeria_name 
FROM 
  menu AS m 
  JOIN pizzeria AS pz ON pz.id = m.pizzeria_id 
WHERE 
  NOT m.id IN (
    SELECT 
      menu_id 
    FROM 
      person_order
  ) 
ORDER BY 
  pizza_name ASC, 
  m.price ASC
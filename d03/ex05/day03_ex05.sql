WITH andrey AS (
  SELECT 
    pv.pizzeria_id 
  FROM 
    person_visits AS pv 
    JOIN person AS p ON p.id = pv.person_id 
  WHERE 
    p.name = 'Andrey' 
  EXCEPT 
  SELECT 
    m.pizzeria_id 
  FROM 
    menu AS m 
    JOIN person_order AS po ON m.id = po.menu_id 
    JOIN person AS p ON p.id = po.person_id 
  WHERE 
    p.name = 'Andrey'
) 
SELECT 
  pz.name 
FROM 
  andrey AS a 
  JOIN pizzeria AS pz ON a.pizzeria_id = pz.id

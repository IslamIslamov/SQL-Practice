WITH all_orders AS(
  SELECT 
    pz.name AS pizzeria_name, 
    p.gender 
  FROM 
    pizzeria AS pz 
    JOIN menu AS m ON pz.id = m.pizzeria_id 
    JOIN person_order AS po ON m.id = po.menu_id 
    JOIN person AS p ON p.id = po.person_id
), 
male AS (
  SELECT 
    ao.pizzeria_name 
  FROM 
    all_orders AS ao 
  WHERE 
    ao.gender = 'male'
), 
female AS (
  SELECT 
    ao.pizzeria_name 
  FROM 
    all_orders AS ao 
  WHERE 
    ao.gender = 'female'
)

(SELECT * FROM female
 EXCEPT
SELECT * FROM male)
  UNION
(SELECT * FROM male
 EXCEPT
SELECT * FROM female)
  ORDER BY
       pizzeria_name ASC;
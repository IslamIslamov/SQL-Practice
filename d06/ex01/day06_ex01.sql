INSERT INTO person_discounts(
  id, person_id, pizzeria_id, discount
) 
SELECT 
  ROW_NUMBER() OVER(
    ORDER BY 
      po.person_id ASC, 
      m.pizzeria_id ASC
  ) AS id, 
  person_id, 
  pizzeria_id, 
  CASE WHEN COUNT(po.id) = 1 THEN 10.5 WHEN COUNT(po.id) = 2 THEN 22 ELSE 30 END AS discount 
FROM 
  person_order AS po 
  JOIN menu AS m ON m.id = po.menu_id 
GROUP BY 
  person_id, 
  pizzeria_id;

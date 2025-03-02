SELECT 
  pv.visit_date AS action_date, 
  p.name AS person_name 
FROM 
  person_visits AS pv 
  JOIN person AS p ON p.id = pv.person_id 
INTERSECT 
SELECT 
  po.order_date AS action_date, 
  p.name AS person_name 
FROM 
  person_order AS po 
  JOIN person AS p ON p.id = po.person_id 
ORDER BY 
  action_date ASC, 
  person_name DESC

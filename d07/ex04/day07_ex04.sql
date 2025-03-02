SELECT 
  p.name, 
  COUNT(pv.pizzeria_id) AS count_of_visits 
FROM 
  person AS p 
  JOIN person_visits AS pv ON p.id = pv.person_id 
GROUP BY 
  p.name 
HAVING 
  COUNT(pv.pizzeria_id) > 3 

SELECT 
  pizzeria_name 
FROM 
  person AS p(person_id, person_name) 
  NATURAL JOIN person_visits AS pv(visit_id) 
  NATURAL JOIN pizzeria AS pz(pizzeria_id, pizzeria_name) 
  NATURAL JOIN menu AS m(id_menu) 
WHERE 
  person_name = 'Dmitriy' 
  AND visit_date = '2022-01-08' 
  AND price < 800

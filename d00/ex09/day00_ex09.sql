SELECT 
	(SELECT p.name FROM person AS p WHERE p.id = pv.person_id) as person_name, 
	(SELECT pz.name FROM pizzeria AS pz WHERE pz.id = pv.pizzeria_id) as pizzeria_name  
FROM 
	(SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') as pv
ORDER BY 
	person_name ASC, 
	pizzeria_name DESC;
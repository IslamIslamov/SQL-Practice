SELECT 
	object_name
FROM 
	(SELECT p.name AS object_name FROM person AS p 
	ORDER BY object_name) AS person_object
UNION ALL
SELECT
	object_name
FROM 
	(SELECT m.pizza_name AS object_name FROM menu AS m 
	ORDER BY object_name) AS menu_object
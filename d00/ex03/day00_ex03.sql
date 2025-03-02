SELECT DISTINCT 
	person_id 
FROM 
	person_visits 
WHERE 
	pizzeria_id = 2 OR 
	(visit_date BETWEEN '06.01.2022' AND '09.01.2022')
ORDER BY 
	person_id DESC
SELECT DISTINCT 
	(SELECT p.name FROM person AS p WHERE p.id = po.person_id ) AS name 
FROM 
	person_order AS po 
WHERE 
	(po.menu_id = 13 OR 
	 po.menu_id = 14 OR
	 po.menu_id = 18) AND po.order_date = '07.01.2022'
CREATE VIEW v_price_with_discount AS 
SELECT 
  p.name AS name, 
  m.pizza_name AS pizza_name, 
  m.price AS price, 
  CAST(m.price - m.price * 0.1 AS INTEGER) AS discount_price 
FROM 
  person AS p 
  JOIN person_order AS po ON p.id = po.person_id 
  JOIN menu AS m ON po.menu_id = m.id 
ORDER BY 
  name ASC, 
  pizza_name ASC

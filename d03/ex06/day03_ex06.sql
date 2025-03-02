WITH pizzas AS (
  SELECT 
    m.pizzeria_id, 
    m.pizza_name, 
    pz.name, 
    m.price 
  FROM 
    menu AS m 
    JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
) 
SELECT 
  pizza_name, 
  pizzeria_name_1, 
  pizzeria_name_2, 
  price 
FROM 
  pizzas AS pizza_1(
    pizzeria_id_1, pizza_name, pizzeria_name_1, 
    price
  ) NATURAL 
  JOIN pizzas AS pizza_2(
    pizzeria_id_2, pizza_name, pizzeria_name_2, 
    price
  ) 
WHERE 
  pizzeria_id_1 > pizzeria_id_2 
ORDER BY 
  pizza_name ASC;

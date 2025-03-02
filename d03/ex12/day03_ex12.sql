WITH min AS (
  SELECT 
    MIN(p.id) AS id 
  FROM 
    person AS p
), 
max AS (
  SELECT 
    MAX(p.id) AS id 
  FROM 
    person AS p
), 
pizzas AS (
  SELECT 
    m.id 
  FROM 
    menu AS m 
  WHERE 
    m.pizza_name = 'greek pizza'
), 
persons AS (
  SELECT 
    COUNT(*) AS c 
  FROM 
    person
), 
orders AS (
  SELECT 
    COUNT(*) AS c 
  FROM 
    person_order
) INSERT INTO person_order 
SELECT 
  GENERATE_SERIES(orders.c + 1, orders.c + persons.c) AS id, 
  GENERATE_SERIES(min.id, max.id) AS person_id, 
  pizzas.id AS menu_id, 
  '2022-02-25' AS order_date 
FROM 
  persons, 
  orders, 
  min, 
  max, 
  pizzas

CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE 
SELECT 
  pizzeria_id, 
  pizza_name 
FROM 
  menu 
WHERE 
  pizzeria_id = 1;

-- если не получается добавить новую запись, то ограничение действует

INSERT INTO menu (
  id, pizzeria_id, pizza_name, price
) 
VALUES 
  (21, 1, 'cheese pizza', 1000);

SET ENABLE_SEQSCAN TO ON;

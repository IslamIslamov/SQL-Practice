SELECT 
  m.id 
FROM 
  menu AS m 
WHERE 
  NOT m.id IN (
    SELECT 
      menu_id 
    FROM 
      person_order
  ) 
ORDER BY 
  m.id ASC

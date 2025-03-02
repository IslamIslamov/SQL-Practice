SELECT 
  name, 
  SUM(total_count) AS total_count 
FROM 
  (
    (
      SELECT 
        pz.name, 
        COUNT(pv.person_id) AS total_count 
      FROM 
        person_visits AS pv 
        JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id 
      GROUP BY 
        pz.name
    ) 
    UNION ALL 
      (
        SELECT 
          pz.name, 
          COUNT(po.person_id) AS total_count 
        FROM 
          person_order AS po 
          JOIN menu AS m ON m.id = po.menu_id 
          JOIN pizzeria AS pz ON pz.id = m.pizzeria_id 
        GROUP BY 
          pz.name
      )
  ) AS sub 
GROUP BY 
  name 
ORDER BY 
  total_count DESC, 
  name ASC

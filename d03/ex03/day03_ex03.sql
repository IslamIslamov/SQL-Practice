WITH all_people AS(
  SELECT 
    pz.name AS pizzeria_name, 
    p.gender 
  FROM 
    person AS p 
    JOIN person_visits AS pv ON p.id = pv.person_id 
    JOIN pizzeria AS pz ON pz.id = pv.pizzeria_id
), 
male AS (
  SELECT 
    ap.pizzeria_name 
  FROM 
    all_people AS ap 
  WHERE 
    ap.gender = 'male'
), 
female AS (
  SELECT 
    ap.pizzeria_name 
  FROM 
    all_people AS ap 
  WHERE 
    ap.gender = 'female'
)

(SELECT * FROM female
 EXCEPT ALL
SELECT * FROM male)
	
  UNION ALL
	
(SELECT * FROM male
 EXCEPT ALL
SELECT * FROM female)
  ORDER BY
       pizzeria_name ASC;

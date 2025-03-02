CREATE OR REPLACE FUNCTION 
	fnc_person_visits_and_eats_on_date(
		pperson TEXT DEFAULT 'Dmitriy',
		pprice NUMERIC DEFAULT 500,
		pdate DATE DEFAULT '2022-01-08'
	)
RETURNS TABLE (pizzeria_name VARCHAR) AS 
$$ BEGIN
	RETURN QUERY
	SELECT DISTINCT pz.name
		FROM menu AS m
	JOIN pizzeria AS pz
		ON m.pizzeria_id = pz.id
	JOIN person_visits AS pv
		ON pz.id = pv.pizzeria_id
	JOIN person AS p
		ON p.id = pv.person_id
	WHERE p.name = $1 AND m.price < $2 AND pv.visit_date = $3;
END $$
LANGUAGE plpgsql;

--- CHECK ---
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300,pdate := '2022-01-01');
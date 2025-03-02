CREATE SEQUENCE seq_person_discounts AS INT OWNED BY person_discounts.id;

SELECT 
  SETVAL(
    'seq_person_discounts', 
    MAX(id)) 
FROM 
  person_discounts;

ALTER TABLE 
  person_discounts ALTER COLUMN id 
SET DEFAULT nextval('seq_person_discounts');

INSERT INTO person_discounts (person_id, pizzeria_id, discount) 
VALUES (4, 4, 98);

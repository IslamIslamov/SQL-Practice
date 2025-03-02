--- Create table ---
CREATE TABLE person_audit (
	created 	TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
	type_event  CHAR(1) 	NOT NULL DEFAULT 'I',
	row_id 		BIGINT 		NOT NULL,
	name 		VARCHAR,
  	age 		INTEGER,
  	gender 		VARCHAR,
  	address 	VARCHAR,
	CONSTRAINT ch_type_event CHECK(type_event IN ('I', 'U', 'D'))
);

--- Trigger ---
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS 
$BODY$
BEGIN
    INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
    	VALUES ('I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NULL;
END;
$BODY$ 
LANGUAGE PLPGSQL VOLATILE;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT 
	ON person
FOR EACH ROW
EXECUTE FUNCTION 
	fnc_trg_person_insert_audit();

--- Insert ---
INSERT INTO person(id, name, age, gender, address) 
	VALUES (10,'Damir', 22, 'male', 'Irkutsk');

--- check audit table ---
SELECT * FROM person_audit;
COMMENT ON TABLE person_discounts IS 'this table stores information about the personal discount of each individual user';
COMMENT ON COLUMN person_discounts.id IS 'this column is primary key for this table';
COMMENT ON COLUMN person_discounts.person_id IS 'the foreign key that binds to the person table';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'the foreign key that binds to the pizzeria table';
COMMENT ON COLUMN person_discounts.discount IS 'this columns contain individual discount';
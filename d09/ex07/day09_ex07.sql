CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS $$
BEGIN
    RETURN (SELECT MIN(val) FROM unnest(arr) AS val);
END;
$$ LANGUAGE plpgsql;


--- CHECK ---
SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
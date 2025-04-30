-- 1er EJERCICIO J



CREATE OR REPLACE FUNCTION existeixClient(p_cliecod SMALLINT)
RETURNS BOOLEAN
AS $$


DECLARE

   v_cliente record;
   

BEGIN
    
    SELECT * 
    INTO STRICT  v_cliente
    FROM cliente
    WHERE cliecod = p_cliecod;
    
RETURN 'TRUE';

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN 'FALSE';
   
END;

$$LANGUAGE PLPGSQL;

-- 2do EJERCICIO J


CREATE OR REPLACE FUNCTION altaClient(p_cliecod SMALLINT)
RETURNS BOOLEAN
AS $$


DECLARE

   v_cliente record;
   

BEGIN
    
    SELECT * 
    INTO STRICT  v_cliente
    FROM cliente
    WHERE cliecod = p_cliecod;
    
RETURN 'TRUE';

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN 'FALSE';
   
END;

$$LANGUAGE PLPGSQL;

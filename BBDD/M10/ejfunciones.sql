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
    WHERE cliecod = p_cliecod
    

   
END;

$$LANGUAGE PLPGSQL;
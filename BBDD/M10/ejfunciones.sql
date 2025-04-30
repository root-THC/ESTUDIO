CREATE OR REPLACE FUNCTION existeixClient(p_cliecod SMALLINT)
RETURNS BOOLEAN
AS $$


DECLARE

   v_cliente record; 
   

BEGIN
    RETURN
    SELECT * 
    INTO STRICT v_cliente 
    FROM cliente
    WHERE cliecod = p_cliecod; 

   

-- EL EXCEPTION PARA QUE CUANDO NO EXISTA EL VALOR MUESTRE UN MENSAJE

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN 'Error no n''hi ha cap valor que coincideixi amb la teva cerca : ' || p_empno;

END;

$$LANGUAGE PLPGSQL;
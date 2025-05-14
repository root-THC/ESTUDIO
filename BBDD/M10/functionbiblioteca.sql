drop function if exists stock0k(p_cant SMALLINT,p_fabcod CHAR,p_prodcod CHAR);

CREATE OR REPLACE FUNCTION usuariOK(p_usuari SMALLINT)
RETURNS BOOLEAN
AS $$

DECLARE
    v_cliente record;

BEGIN
    SELECT * 
    INTO STRICT  v_cliente
    FROM cliente
    WHERE cliecod = p_cliecod;
    
    RETURN TRUE;

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;

$$LANGUAGE PLPGSQL;
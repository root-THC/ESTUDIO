drop function if exists stock0k(p_cant SMALLINT,p_fabcod CHAR,p_prodcod CHAR);

CREATE OR REPLACE FUNCTION usuariOK(p_usuari INTEGER)
RETURNS VARCHAR
AS $$

DECLARE
    v_usuario record;

BEGIN
    SELECT bloquejat 
    INTO STRICT  v_cliente
    FROM cliente
    WHERE cliecod = p_cliecod;
    
    RETURN TRUE;

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;

$$LANGUAGE PLPGSQL;
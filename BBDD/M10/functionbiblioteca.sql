drop function if exists stock0k(p_cant SMALLINT,p_fabcod CHAR,p_prodcod CHAR);

CREATE OR REPLACE FUNCTION usuariOK(p_usuari INTEGER)
RETURNS VARCHAR
AS $$

DECLARE
    v_usuario record;

BEGIN
    SELECT bloquejat 
    INTO STRICT  v_cliente
    FROM usuario
    WHERE idusuari = p_usuari;
    
    IF bloquejat THEN
        RETURN '1:usuari bloquejat';
    ELSE 
        RETURN '0:usuari no té cap bloqueig i pot fer el prèstec';
    END IF;
    

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN '2: usuari ' || p_empno || ''; 

END;


    RETURN TRUE;


EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;

$$LANGUAGE PLPGSQL;
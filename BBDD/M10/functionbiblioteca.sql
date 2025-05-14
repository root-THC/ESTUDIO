drop function if exists usuariOK(p_usuari INTEGER);
drop function if exists documentsPrestats(p_usuari INTEGER, p_format VARCHAR (100));

--1 EJERCICIO

CREATE OR REPLACE FUNCTION usuariOK(p_usuari INTEGER)
RETURNS VARCHAR
AS $$

DECLARE
    v_bloquejat usuari.bloquejat%TYPE;

BEGIN
    SELECT bloquejat 
    INTO STRICT  v_bloquejat
    FROM usuari
    WHERE idusuari = p_usuari;
    
    IF v_bloquejat THEN
        RETURN '1:usuari bloquejat';
    ELSE 
        RETURN '0:usuari no té cap bloqueig i pot fer el prèstec';
    END IF;
    

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN '2: usuari ' || p_usuari || ' inexistent'; 

END;

$$LANGUAGE PLPGSQL;

-- 2 FUNCIÓN

CREATE OR REPLACE FUNCTION documentsPrestats(p_usuari INTEGER, p_format VARCHAR(100))
RETURNS VARCHAR
AS $$

DECLARE
    v_bloquejat usuari.bloquejat%TYPE;

BEGIN
    SELECT idDocument 
    INTO STRICT  v_bloquejat
    FROM usuari
    WHERE idusuari = p_usuari;
    
    IF v_bloquejat THEN
        RETURN '1:usuari bloquejat';
    ELSE 
        RETURN '0:usuari no té cap bloqueig i pot fer el prèstec';
    END IF;
    

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN '2: usuari ' || p_usuari || ' inexistent'; 

END;

$$LANGUAGE PLPGSQL;
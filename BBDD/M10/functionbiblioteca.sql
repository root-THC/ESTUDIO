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

CREATE OR REPLACE FUNCTION documentsPrestats(p_usuari INT, p_format VARCHAR(100))
RETURNS INT AS $$

DECLARE
    v_numero INT;

BEGIN

    SELECT COUNT(*)
    
    INTO STRICT v_numero
    FROM prestec p

    JOIN exemplar e ON e.idExemplar = p.idExemplar
    
    JOIN document d ON e.idDocument = d.idDocument
    
    WHERE p.dataDev IS NULL AND p.idUsuari = p_usuari AND LOWER(d.format) = p_format;

    RETURN v_numero;

END;

$$LANGUAGE PLPGSQL;
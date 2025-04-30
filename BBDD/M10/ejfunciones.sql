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

CREATE SEQUENCE cliecod_seq;
SELECT setval('cliecod_seq', (select max(cliecod) from cliente), true);

CREATE OR REPLACE FUNCTION altaClient(p_nombre,p,repcod,p_limcred SMALLINT)
RETURNS VARCHAR
AS $$


DECLARE

   v_cliente record;
   

BEGIN
    
    SELECT * 
    INTO STRICT  v_cliente
    FROM cliente
    WHERE cliecod = p_cliecod;
    
RETURN 'Client ' || v_cliente.repcod || ' s''ha donat d''alta correctament ';

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN 'FALSE';
   
END;

$$LANGUAGE PLPGSQL;

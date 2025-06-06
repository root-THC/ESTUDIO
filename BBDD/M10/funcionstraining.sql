\c training
drop function if exists existeixClient(p_cliecod SMALLINT);
drop function if exists altaClient(p_nombre VARCHAR (20),p_repcod SMALLINT,p_limcred NUMERIC (8,2));
drop function if exists stock0k(p_cant SMALLINT,p_fabcod CHAR,p_prodcod CHAR);
drop SEQUENCE if exists cliecod_seq;


CREATE SEQUENCE cliecod_seq;
SELECT setval('cliecod_seq', (select max(cliecod) from cliente), true);

CREATE SEQUENCE pedido_seq;

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
    
    RETURN TRUE;

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;

$$LANGUAGE PLPGSQL;

-- 2do EJERCICIO J

CREATE OR REPLACE FUNCTION altaClient(p_nombre VARCHAR (20),p_repcod SMALLINT,p_limcred NUMERIC (8,2))
RETURNS VARCHAR
AS $$


DECLARE

   v_repcod cliente.repcod%type;
   

BEGIN
    SELECT repcod
    INTO STRICT  v_repcod
    FROM repventa 
    WHERE repcod = p_repcod;
    


    INSERT INTO cliente VALUES (NEXTVAL('cliecod_seq'),p_nombre,p_repcod,p_limcred);

    RETURN 'Client ' || p_nombre || ' s''ha donat d''alta correctament ';

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN 'El representant ' || p_repcod || ' no existeix';
   
END;

$$LANGUAGE PLPGSQL;


-- 3 er ej J

CREATE OR REPLACE FUNCTION stock0k(p_cant SMALLINT,p_fabcod CHAR,p_prodcod CHAR)
    RETURNS boolean
    AS $$
       DECLARE
        v_exists SMALLINT;
        BEGIN

            SELECT exist
            INTO STRICT v_exists 
            FROM producto
            WHERE fabcod = p_fabcod AND prodcod = p_prodcod;

            IF p_cant > v_exists THEN
                RETURN FALSE;
            ELSE
                RETURN TRUE;
            END IF;
        END; 
    $$ LANGUAGE PLPGSQL;


-- 4 to ej J

CREATE OR REPLACE FUNCTION altaComanda(p_cliecod SMALLINT,p_cant SMALLINT,p_fabcod CHAR,p_prodcod CHAR )
RETURNS VARCHAR
AS $$     
    DECLARE 
        v_productos record;
        v_importe numeric;
    BEGIN 
        SELECT *
        INTO STRICT v_productos
        FROM producto
        WHERE fabcod = p_fabcod AND prodcod = p_prodcod;
        
        IF existeixClient(p_cliecod) THEN 
            IF stock0k (p_cant,p_fabcod ,p_prodcod ) THEN 
                v_importe := v_productos.precio * p_cant;
                INSERT INTO pedido VALUES (NEXTVAL('pedido_seq'),CURRENT_DATE,p_cliecod,NULL,p_fabcod,p_prodcod,p_cant,v_importe)
                RETURN 'El pedido de ' || p_cliecod || ' es apto '|| 'el importe del pedido es de '|| v_importe || '€' ;
            ELSE
                RETURN 'El cliente ' || p_cliecod || ' existe pero no disponemos de suficientes unidades solo disponemos de ' || v_productos.exist ;
            END IF;        
        ELSE 
            RETURN 'El cliente ' || p_cliecod || ' no existe';
        END IF;  

    END; 
    $$ LANGUAGE PLPGSQL;
    $$LANGUAGE PLPGSQL;

-- training=> SELECT altaComanda(2111::SMALLINT,20::SMALLINT,'rei'::VARCHAR,'2a45c'::VARCHAR);^C
















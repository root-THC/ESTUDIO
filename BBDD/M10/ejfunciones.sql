CREATE OR REPLACE FUNCTION existeixClient(p_cliecod SMALLINT)
RETURNS BOOLEAN
AS $$


DECLARE

   v_cliente record; 
   

BEGIN

    SELECT * 
    INTO STRICT v_cliente 
    FROM cliente
    WHERE cliecod = p_cliecod; 

    IF 
        LOWER(v_emp.job)= 'salesman' THEN v_sal := v_emp.sal * 1.1;
    ELSE 
        ENDIF;
    IF
        LOWER(v_emp.job)= 'clerk' THEN v_sal := v_emp.sal * 1.2;
    ELSE
        ENDIF; 
    IF 
        v_sal := v_emp.sal * 1.3;
    
   
    
    RETURN  'L''empleat ' || v_emp.ename || ' treballa de ' || v_emp.job;

-- EL EXCEPTION PARA QUE CUANDO NO EXISTA EL VALOR MUESTRE UN MENSAJE

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN 'Error no n''hi ha cap valor que coincideixi amb la teva cerca : ' || p_empno;

END;

$$LANGUAGE PLPGSQL;
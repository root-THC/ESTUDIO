CREATE OR REPLACE FUNCTION existeixClient(p_empno SMALLINT)
RETURNS BOOLEAN
AS $$

-- EL RECORD ES PARA GUARDAR X VALORES
DECLARE

   v_emp record; -- variable compuesta
   v_sal emp.sal%type

BEGIN

    SELECT * 
    INTO STRICT v_emp -- la variable de antes
    FROM emp
    WHERE empno = p_empno; -- parametro del codigo del empleado

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
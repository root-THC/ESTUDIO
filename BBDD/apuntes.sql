
--APUNTES SQL

-- Lineas de comando sql 

\d tabla 

--para ver información de la tablla

--SELECTS :
SELECT UPPER (‘hOlA’);
resultado todo en mayúscula

SELECT LOWER (‘hOlA’);
resultado todo en minúscula


--Fecha
TO_DATE(‘12/07/24’,’dd/mm/yy’)

--SECUENCIA

CREATE SEQUENCE nombre_secuencia
START WITH 10 INCREMENT BY 20;

SELECT NEXTVAL ('nombre_secuencia',otrovalor,otrovalor);

--FUNCION CALCULOS ENTRE CAMPOS

SELECT SUM(comm/count(*))


--FUNCIONES DE  GRUPO

-- HACER MEDIA DE FILAS
SELECT COUNT AVG(COALESCE(comm,0))
FROM emp;

-- HACER MEDIAS DE DIFERENTES GRUPOS POR EJEMPLO MEDIA DEL DEPARTAMENTO 10,20,30 separados


SELECT campo , AVG(campo que queremos que haga media)
FROM tabla
GROUP by campo;

SELECT deptno, avg (sal)
FROM emp
GROUP by deptno;

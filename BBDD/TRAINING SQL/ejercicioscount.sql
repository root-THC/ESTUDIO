--NUMERO DE DEPARTAMENTOS ASIGNADOS a empleados
 
SELECT COUNT(DISTINCT deptno) "Num " -- DISTINCT es para que borre filas duplicadas solo muestre una vez el valor
FROM emp; 
--NUMERO DE CAPS 

SELECT COUNT(DISTINCT mgr) "Numero jefe"
FROM emp;

--NUMERO DE TRABAJOS DIFERENTES
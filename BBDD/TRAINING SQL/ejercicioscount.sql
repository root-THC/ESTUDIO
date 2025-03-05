--NUMERO DE DEPARTAMENTOS ASIGNADOS a empleados
/* 
SELECT COUNT(DISTINCT deptno) "Num Depts Asignados" -- DISTINCT es para que borre filas duplicadas solo muestre una vez el valor
FROM emp; 

--NUMERO DE CAPS 

SELECT COUNT(DISTINCT mgr) "Numero jefe"
FROM emp;

--NUMERO DE TRABAJOS DIFERENTES

SELECT COUNT(DISTINCT job) "Numero Trabajos"
FROM emp
WHERE job IS NOT NULL;
*/
--Calcular el salari total mensual.

SELECT SUM(sal) "Salario Mensual"
FROM emp;

--Calcular el nombre d'empleats que tenen comissió i la mitjana. Volem Mostreu tots els empleats, de manera que pretén en compte que el camp comm pot tenir nuls

SELECT COUNT(empNO) "Numero Empleados", AVG (comm) "Mediana Comisión"
FROM emp;
--Mostreu el salari, mínim i màxim dels empleats, agrupats per ocupació.
--Seguint el que s'ha explicat en l'ex. 27, Mostreu per cada departament, el nombre d'empleats que tenen comissió, la suma i la mitjana.
--Idem que el 4, però mostrant a més el nom de departament.

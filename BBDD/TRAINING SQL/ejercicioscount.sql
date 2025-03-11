-- COUNT (*) CUENTA FILAS COUNT 

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

-- 1 Calcular el salari total mensual.

SELECT SUM(sal) "Salario Mensual"
FROM emp;

--Calcular el nombre d'empleats que tenen comissió i la mitjana. Volem Mostreu tots els empleats, de manera que pretén en compte que el camp comm pot tenir nuls

SELECT COUNT(empNO) "Numero Empleados", round(avg(coalesce(comm,0)),2) "Mediana Comisión"
FROM emp;

--Mostreu el salari, mínim i màxim dels empleats, agrupats per ocupació.

SELECT MIN(sal), MAX(sal),job 
FROM emp 
GROUP by job;
*/
--Seguint el que s'ha explicat en l'ex. 27, Mostreu per cada departament, el nombre d'empleats que tenen comissió, la suma i la mitjana.

SELECT deptno, COUNT(comm) , SUM(comm) , AVG(comm)
FROM emp
--WHERE deptNO = 10 OR deptNO = 20
GROUP BY deptno;
--Idem que el 4, però mostrant a més el nom de departament.

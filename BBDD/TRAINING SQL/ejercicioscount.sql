-- COUNT (*) CUENTA FILAS  | COUNT (campo) cuenta la fila si tiene valor 
  
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

SELECT deptno, COUNT(comm) , SUM(comm) , AVG(COALESCE(comm,0)) -- Para que haga la mediana de los 14 empleados si tienen valor y si es nulo
FROM emp
WHERE deptNO IN (10,20)
GROUP BY deptno;
--Idem que el 4, però mostrant a més el nom de departament.

--Cláusula GROUP BY MÚLTIPLES COLUMNAS
--SELECT COUNT (distinct (deptno,job)) FROM emp; para saber las filas que hay es del gitlab

--GRUPO
-- * SIN GROUP BY = 1 fila que muestra el valor de las filas que hay 
-- * con "" = tantos como valores diferentes que tenga el campo se agrupará

--LIMITE MUESTRAME EL TOP 5 QUE COBRAN MÁS EL LIMIT 5 
-- SELECT ename , sal from emp ORDER BY sal DESC LIMIT 5;

-- HAVING ES COMO EL WHERE PERO CON LAS FUNCIONES DE GRUPO PARA FILTRAR EL ORDEN DE SINTAXIS VA DESPUES DEL GROUP BY


-- MUESTRA POR DEPARTAMIENTO Y SU SALARIO MÁS ALTO DE LOS EMPLEADOS QUE SON SALES MAN
SELECT deptno , max(sal)
FROM emp 
WHERE LOWER(job) = 'salesman'
GROUP BY deptno 
HAVING MAX(sal)>2900;

-- WHERE ES SOLO PARA filtrar campos y el HAVING para funciones de grupo 




-- MUESTRA POR DEPARTAMIENTO Y SU SALARIO MÁS ALTO DE LOS EMPLEADOS QUE SON SALES MAN


--Mostreu el salari mínim, màxim i mig dels empleats agrupats per feina, però només d'aquells la mitjana sigui superior a 4000.

SELECT  job , MIN(sal) , MAX(sal) , AVG(sal)
FROM emp 
GROUP by job 
HAVING AVG(sal) > 4000;


--Vegeu el nombre i el nom dels departaments que tinguin més de tres empleats assignats.



--QUIENES SON LOS QUE COBRAN MÁS UNA SUBCONSULTA ES UNA CONSULTA DENTRO DE OTRA CONSULTA

SELECT ename 
FROM emp 
WHERE sal= (SELECT MAX(sal) FROM emp);

-- MOSTRAR LOS EMPLEADOS QUE COBRAN MAS DE LA MEDIANA
SELECT ename,sal 
FROM emp 
WHERE sal > (SELECT AVG(sal) FROM emp);

-- nombre del empleado mas antiguo

SELECT ename 
FROM emp 
WHERE hiredate = (SELECT MIN(hiredate) FROM emp);

-- ANIDAMIENTO DE FUNCIONES DE GRUPOS 

SELECT MAX(campotemporal) 
FROM 
(SELECT AVG(sal)campotemporal FROM emp GROUP BY deptno) nombretablatemporal ;


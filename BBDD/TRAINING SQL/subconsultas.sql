--QUIENES SON LOS QUE COBRAN MÁS UNA SUBCONSULTA ES UNA CONSULTA DENTRO DE OTRA CONSULTA

SELECT ename FROM emp WHERE sal= (SELECT MAX(sal) FROM emp);

-- MOSTRAR LOS EMPLEADOS QUE COBRAN MAS DE LA MEDIANA
SELECT ename FROM emp WHERE sal= (SELECT AVG(sal) FROM emp);

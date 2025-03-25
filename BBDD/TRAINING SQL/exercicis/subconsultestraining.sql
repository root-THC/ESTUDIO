

/*
MULTIREGISTRE VARIAS FILAS
 
SELECT nombre , puesto 
FROM repventa
WHERE repcod = IN 
(SELECT jefe FROM repventa);

MUESTRA LOS DEPARTAMENTOS QUE NO TIENEN ASIGNADO NINGÚN JEFE

Esto es una resta para 2 tablas tenemos que restar los que si sabemos que estan asignados
a los que no estan asignados

IN  = (ANY = ALGUNO)
ALL = TODOS por si no filtramos con clave primaria 

SELECT deptno 
FROM dept
WHERE deptno 
NOT IN (SELECT deptno FROM emp);

 -- EN VEZ DE NOT IN PODRÍA SER != ALL SIGNIFICA DIFERENTE DE 


MUESTRA TODOS LOS EMPLEADOS QUE COBRAN MÁS QUE LOS EMPLEADOS DEL DEPT 30 USAMOS EL ALL PORQUE SINO MOSTRARIA SOLO 1 YA QUE UNA SUBCONSULTA NECESITA ALGO DETRÁS

SELECT ename, sal, deptno
FROM emp
where sal > ALL (select sal from emp where deptno=30);


 Mostra el nom del empleats que són cap

 SELECT ename 
 FROM emp
 WHERE empno IN (SELECT mgr FROM emp);

Los que no son jefes

SELECT ename 
 FROM emp
 WHERE empno NOT IN (SELECT mgr FROM emp WHERE mgr IS NOT NULL); 

 EL NULL ES IMPORTANTE PORQUE AL DEVOLVER UN NULL QUE ES PRESIDENTE NOS 
 DA UN VALOR FALSO POR ESO NO MOSTRARIA NADA SI NO ESTUVIERA WHERE mgr IS NOT NULL


0. Mostrar el nom i el lloc dels que són cap (ja està fet amb self join, ara amb subconsultes)
1. Obtenir una llista dels representants les quotes dels quals són iguals o superiors a lobjectiu de loficina dAtlanta.

2. Obtenir una llista de tots els clients (nom) que van ser contactats per primera vegada per Bill Adams.

3. Obtenir una llista de tots els productes del fabricant ACI les del qual existències superen les existències del producte 41004 del mateix fabricant.

4. Obtenir una llista dels representants que treballen a les oficines que han aconseguit superar el seu objectiu de vendes.

5. Obtenir una llista dels representants que no treballen a les oficines dirigides per Larry Fitch.

6. Obtenir una llista de tots els clients que han demanat comandes del fabricant ACI entre gener i juny del 2003.

7. Obtenir una llista dels productes dels quals s'ha pres una comanda de 150 euros o més.

8. Obtenir una llista dels clients contactats per Sue Smith que no han sol·licitat comandes amb imports superiors a 18 euros.

9. Obtenir una llista de les oficines on hi hagi algun representant la quota del qual sigui més del 55% de l'objectiu de l'oficina. Per comprovar el vostre exercici, feu una Consulta prèvia el resultat de la qual valideu l'exercici.

SELECT ciudad , objetivo , cuota , 0.55*objetivo FROM repventa r 
JOIN oficina o ON r.ofinum = o.ofinum
WHERE cuota > 0.55*objetivo;


SELECT ciudad FROM oficina o WHERE objetivo * 0.55 < ANY
(SELECT cuota FROM repventa r WHERE r.ofinum=o.ofinum);



10. Obtenir una llista dels representants que han pres alguna comanda l'import del qual sigui més del 10% de la seva quota.

11. Obtenir una llista de les oficines on el total de vendes dels seus representants han aconseguit un import de vendes que supera el 50% de lobjectiu de loficina. Mostrar també l'objectiu de cada oficina (suposeu que el camp vendes d'oficina no existeix).

12. Quina és la descripció del primer producte sol·licitat en una comanda? 13. Quin representant té el millor percentatge de vendes?

14. Quin representant té el pitjor percentatge de vendes?

Quin producte (Descripció) té més comandes?
16 . Quin producte s'ha venut més?
*/

SELECT descrip
FROM producto 
WHERE pednum NOT IN (SELECT fabcod,prodcod FROM pedido);


SELECT pednum
FROM pedido 
WHERE = 
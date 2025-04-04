
/*

7. Obtenir una llista de les comandes amb imports superiors
a 2000 euros, mostrant el número de comanda, import, nom del
client que ho va sol·licitar i el nom del representant que va contactar
amb el client per primera vegada.
*/
/*

SELECT pednum, 
       importe, 
       c.nombre AS "Nombre Cliente", 
       p.fecha, 
       r.nombre AS "Representante que contacto por primera vez"
FROM pedido p 
JOIN cliente c ON p.cliecod = c.cliecod
JOIN repventa r ON c.repcod = r.repcod 
WHERE p.importe > 2000;
*/

/*
8. Obtenir una llista de les comandes amb imports superiors a 150 euros, 
mostrant el codi de la comanda, l'import, el nom del
client que ho va sol·licitar, el nom del representant que va contactar
amb ell per primera vegada i la ciutat de loficina on el
representant treballa.



SELECT pednum, 
       importe, 
       c.nombre AS "Nombre Cliente", 
       p.fecha, 
       r.nombre AS "Representante que contacto por primera vez",
       o.ciudad
FROM pedido p 
JOIN cliente c ON p.cliecod = c.cliecod
JOIN repventa r ON c.repcod = r.repcod
JOIN oficina o ON r.ofinum = o.ofinum 
WHERE p.importe > 150;



*/


/*

9. Llista les comandes preses durant el mes d'octubre de l'any 2003 ,
mostrant només el número de la comanda, el seu import, el nom del
client que ho va realitzar, la data i la descripció del producte
sol·licitat



SELECT pednum , importe , fecha ,c.nombre , pr.descrip
FROM pedido p
JOIN cliente c ON p.cliecod = c.cliecod
JOIN producto pr ON p.fabcod = pr.fabcod AND p.prodcod = pr.prodcod
WHERE TO_CHAR(fecha+5000, 'mm-yyyy') = '10-2003';
*/


/*

10. Obtenir una llista de totes les comandes preses per representants de
oficines de la regió Est, mostrant només el número del
comanda, la descripció del producte i el nom del representant
que ho va prendre

11. Obtenir les comandes preses els mateixos dies en què un nou
representant va ser contractat. Mostrar número de comanda, import,
data comanda.

*/
/*
12. Obtenir una llista amb parelles de representants i oficines on la quota del representant és més 
gran o igual que l'objectiu de la oficina, sigui o no l'oficina on treballa. Mostra Nom del representant, quota del mateix, Ciutat de l'oficina, objectiu de la mateixa.

-- El cross join es para cuando queremos relacionar 2 campos que no estan relacionados por CP primearia O CA aliena

SELECT nombre, cuota, ciudad , objetivo
FROM repventa
CROSS JOIN oficina
WHERE cuota >= objetivo
ORDER BY 1;
*/


/*
13. Mostra el nom, les vendes i la ciutat de l'oficina de cada representant de lempresa.


-- PRIMERO VEMOS CUANTOS REPRESENTANTES DEBERIAN SALI CON UN select* from repventa; ya que nos dice de cada representante

SELECT nombre "Nombre Representante" , ciudad , r.ventas 
FROM repventa r LEFT join oficina o on r.ofinum = o.ofinum;
*/
/*
14. Obtenir una llista de la descripció dels productes per als quals existeix alguna comanda en què se sol·licita una quantitat més gran a les existències del producte.

SELECT descrip , p.cant , pr.exist
FROM producto pr
JOIN pedido p ON p.fabcod || p.prodcod = pr.fabcod || pr.prodcod
WHERE p.cant > pr.exist; 



--15. Llista els noms dels representants que tenen una quota superior a la del director.

-- En los joins mandan las claves alienas


SELECT r.nombre
FROM repventa r 
JOIN oficina o ON r.ofinum = o.ofinum
JOIN repventa director ON o.director = director.repcod
WHERE r.cuota > director.cuota; 




16. Obtenir una llista dels representants que treballen en una oficina diferent de l'oficina on treballa el seu director, mostrant també el nom del director i el codi de l'oficina on treballa cadascun.

SELECT r.nombre , r.ofinum , director.nombre , director.ofinum
FROM repventa r 
JOIN oficina o ON r.ofinum = o.ofinum
JOIN repventa director ON o.director = director.repcod
WHERE r.ofinum != director.ofinum; 


17. El mateix exercici anterior, però en comptes d'ofinum, la ciutat.

18. Mostrar el nom i el lloc de què són cap. Esto es un selfjoin

SELECT jefe.nombre , jefe.puesto
FROM repventa r 
JOIN repventa jefe 
ON r.jefe = jefe.repcod;

*/

--Por cada representante mostrar el nombre i la ciutat de la seva oficina mas numero de comanda y importe de comanda que hayan echo o no el pedido
-- SI SE HACE UN OUTER LEFT JOIN se referira a todo lo que hay antes y right al campo de la derecha los campos del join etc.. y lo mismo para la derecha
/*
SELECT  pednum "Num Pedido " , p.importe "Importe Pedido", r.nombre , COALESCE(o.ciudad::TEXT,  'sin oficina'  )  Oficina , pr.descrip "Descripción" , c.nombre
FROM repventa r 
LEFT JOIN oficina o
ON r.ofinum = o.ofinum

LEFT JOIN pedido p 
ON p.repcod = r.repcod

LEFT JOIN producto pr 
ON pr.fabcod = p.fabcod AND pr.prodcod = p.prodcod

LEFT JOIN cliente c
ON p.cliecod = c.cliecod;



-- Lista de pedidos si hubiera algun representante ni pedido , ni producto ni cliente porque es lo que hay todo antes de repventa
SELECT  pednum "Num Pedido " , 
p.importe "Importe Pedido", 
r.nombre , 
COALESCE(o.ciudad::TEXT,  'sin oficina'  )  Oficina , 
pr.descrip "Descripción" , c.nombre
FROM pedido p 

JOIN producto pr
              ON p.fabcod = pr.fabcod AND p.prodcod =pr.prodcod
JOIN cliente c
              ON p.cliecod = c.cliecod
RIGHT JOIN repventa r 
       ON p.repcod = r.repcod
LEFT JOIN oficina o 
       ON r.ofinum = o.ofinum;
*/
--CONTAR FILAS  de una tabla.
SELECT count (*)
FROM repventa;
       

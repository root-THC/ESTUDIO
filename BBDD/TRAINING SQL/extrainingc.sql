
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
*/


SELECT pednum , importe , fecha ,c.nombre , pr.descrip
FROM pedido p
JOIN cliente c ON p.cliecod = c.cliecod
JOIN producto pr ON p.fabcod = pr.fabcod AND p.prodcod = pr.prodcod
WHERE TO_CHAR(fecha 'mm-yyyy')= '10-' BETWEEN '2003-10-01' AND '2003-11-01';

/*

10. Obtenir una llista de totes les comandes preses per representants de
oficines de la regió Est, mostrant només el número del
comanda, la descripció del producte i el nom del representant
que ho va prendre

11. Obtenir les comandes preses els mateixos dies en què un nou
representant va ser contractat. Mostrar número de comanda, import,
data comanda.

*/
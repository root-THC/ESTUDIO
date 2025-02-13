--B. Consultes Multitaula

--1. Obtenir les dades dels productes les existències dels quals estiguin entre 25 i 40 unitats.

--SELECT nombre, ciudad, region
--FROM repventa r JOIN oficina o ON r.ofinum = o.ofinum;

--2. Obtenir una llista de totes les comandes, mostrant el número de comanda, el seu import, el nom del client que el va fer i el límit de crèdit del client.
--SELECT DISTINCT p.pednum, p.importe, c.nombre, c.limcred
--FROM pedido p JOIN cliente c ON p.cliecod = c.cliecod;

--3. Obtenir una llista de representants ordenada alfabèticament, en què es mostri el nom del representant, codi de la oficina on treballa, ciutat i la regió on ven.

--SELECT r.nombre, r.ofinum, o.ciudad, o.region  
--FROM repventa r JOIN oficina o ON r.ofinum = o.ofinum ORDER BY 1;

-- REP COD NO ESTA EN OFICINA EN LA TABLA COMO TAL CREADA


--4. Obtenir una llista de les oficines (ciutats, no codis) que tenen un objectiu superior a 360.000 euros. Per a cada oficina mostrar la ciutat, el seu objectiu, el nom del director i lloc del mateix.

--SELECT o.ciudad, o.objetivo, r.nombre, r.puesto
--FROM oficina o JOIN repventa r ON r.ofinum = o.ofinum
--WHERE objetivo > 360000;


--5. Obtenir una llista de totes les comandes mostrant el seu número, el import i la descripció dels productes sol·licitats.

--SELECT p.pednum , p.importe , pr.descrip 
--FROM pedido p JOIN producto pr ON  p.prodcod = pr.prodcod AND p.fabcod = pr.fabcod;


/*
6. Obtenir una llista de les comandes amb imports superiors a 4000. 
Mostrar el nom del client que va sol·licitar la comanda, número de la comanda, 
import de la mateixa, la descripció del producte sol·licitat i el nom del representant que el va prendre. 
Ordeneu la llista per client alfabèticament i després per import de més gran a més petit.


SELECT c.nombre , p.pednum  ,  p.importe , pr.descrip , r.nombre
FROM pedido p
JOIN cliente c ON p.cliecod = c.cliecod
JOIN producto pr ON p.fabcod = pr.fabcod AND p.prodcod = pr.prodcod
JOIN repventa r ON p.repcod = r.repcod
WHERE p.importe > 4000
ORDER BY c.nombre ASC, p.importe DESC;

*/

/*
7. Obtenir una llista de les comandes amb imports superiors
a 2000 euros, mostrant el número de comanda, import, nom del
client que ho va sol·licitar i el nom del representant que va contactar
amb el client per primera vegada.


SELECT p.pednum , p.importe , c.nombre , r.nombre , p.fecha
FROM pedido p 
JOIN repventa r ON p.repcod = r.repcod
JOIN cliente c ON p.cliecod = c.cliecod
JOIN (
    SELECT cliecod, MIN(fecha) AS primera_fecha
    FROM pedido
    GROUP BY cliecod
) sub ON p.cliecod = sub.cliecod AND p.fecha = sub.primera_fecha
WHERE p.importe > 2000;
*/




/*
8. Obtenir una llista de les comandes amb imports superiors a 150 euros, 
mostrant el codi de la comanda, l'import, el nom del
client que ho va sol·licitar, el nom del representant que va contactar
amb ell per primera vegada i la ciutat de loficina on el
representant treballa.
*/
/*
SELECT p.pednum , p.importe , c.nombre , r.nombre 
FROM pedido p 
JOIN 



WHERE p.importe > 150;
*/



/*
9. Llista les comandes preses durant el mes d'octubre de l'any 2003 ,
mostrant només el número de la comanda, el seu import, el nom del
client que ho va realitzar, la data i la descripció del producte
sol·licitat



10. Obtenir una llista de totes les comandes preses per representants de
oficines de la regió Est, mostrant només el número del
comanda, la descripció del producte i el nom del representant
que ho va prendre

11. Obtenir les comandes preses els mateixos dies en què un nou
representant va ser contractat. Mostrar número de comanda, import,
data comanda.
*/

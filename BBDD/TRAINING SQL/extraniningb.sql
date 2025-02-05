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

SELECT ciudad, objetivo, nombre, puesto
FROM repventa r JOIN 


--5. Obtenir una llista de totes les comandes mostrant el seu número, el import i la descripció dels productes sol·licitats.


--6. Obtenir una llista de les comandes amb imports superiors a 4000. Mostrar el nom del client que va sol·licitar la comanda, número de la comanda, import de la mateixa, la descripció del producte sol·licitat i el nom del representant que el va prendre. Ordeneu la llista per client alfabèticament i després per import de més gran a més petit.
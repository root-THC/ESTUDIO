--B. Consultes Multitaula

--1. Obtenir les dades dels productes les existències dels quals estiguin entre 25 i 40 unitats.

--SELECT nombre, ciudad, region
--FROM repventa r JOIN oficina o ON r.ofinum = o.ofinum;

--2. Obtenir una llista de totes les comandes, mostrant el número de comanda, el seu import, el nom del client que el va fer i el límit de crèdit del client.
--SELECT DISTINCT p.pednum, p.importe, c.nombre, c.limcred
--FROM pedido p JOIN cliente c ON p.cliecod = c.cliecod;


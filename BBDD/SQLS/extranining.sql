

--1. Obtenir les dades dels productes les existències dels quals estiguin entre 25 i 40 unitats.
--SELECT * FROM producto WHERE exist BETWEEN 25 AND 40;


--2. Obtenir els codis dels representants que han pres alguna comanda (evitant-ne la repetició).

--SELECT DISTINCT repcod FROM pedido WHERE repcod IS NOT NULL;

--3. Obtenir les dades de les comandes realitzades pel client el codi és el 2111.

--SELECT * FROM pedido WHERE cliecod = '2111';


--4. Obtenir les dades de les comandes realitzades pel client el codi és el 2111 i que han estat presos pel representant el codi és el 103.

--SELECT * FROM pedido WHERE cliecod = '2111' AND repcod=103;


--5. Obtenir les dades de les comandes realitzades pel client el codi és el 2111, que han estat presos pel representant el codi del qual és el 103 i que sol·liciten articles del fabricant el codi del qual és ACI.

--SELECT * FROM pedido WHERE cliecod = '2111' AND repcod=103 AND fabcod='aci';



--6. Obtenir una llista de totes les comandes ordenades per client i, per cada client, ordenats per la data de la comanda (ascendentment)

--SELECT * FROM pedido ORDER BY 2;


--7. Obtenir les dades dels representants que pertanyen a loficina de codi 12 i 13 (cada representant només pertany a una oficina).

--SELECT * FROM repventa WHERE ofinum = 12 OR ofinum = 13;




--8. Obtenir les dades de productes dels quals no hi ha existències o bé aquestes són desconegudes.
--SELECT * FROM producto WHERE exist=0 OR exist IS NULL;


--9. Mostrar els representants que van ser contractats el 2003 (sumem 5000 a la data de contracte)

--SELECT *, fcontrato + 5000 AS "fechanueva" FROM repventa WHERE fcontrato + 5000 BETWEEN '2003-01-01' AND '2003-12-31';
--SELECT * FROM repventa 
--WHERE TO_CHAR(fcontrato +5000 ,'YYYY')='2003';

--10. Mostrar el nom i els dies que porta contractats els representants

--SELECT nombre , (CURRENT_DATE - fcontrato) AS "dias contratado" FROM repventa; 

/*
*/


--B CONSULTA MULTITAULA
SELECT nombre, ciudad, region
FROM repventa JOIN oficina ON repventa.ofinum = oficina.ofinum;

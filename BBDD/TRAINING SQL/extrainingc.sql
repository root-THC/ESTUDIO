
/*

7. Obtenir una llista de les comandes amb imports superiors
a 2000 euros, mostrant el número de comanda, import, nom del
client que ho va sol·licitar i el nom del representant que va contactar
amb el client per primera vegada.
*/


SELECT p.pednum , p.importe , c.nombre , r.nombre , p.fecha , p.repcod
FROM pedido p 
JOIN repventa r ON p.repcod = r.repcod 
JOIN cliente c ON p.cliecod = c.cliecod
JOIN 
WHERE p.importe > 2000;






/*
8. Obtenir una llista de les comandes amb imports superiors a 150 euros, 
mostrant el codi de la comanda, l'import, el nom del
client que ho va sol·licitar, el nom del representant que va contactar
amb ell per primera vegada i la ciutat de loficina on el
representant treballa.


SELECT p.pednum , p.importe , c.nombre , r.nombre 
FROM pedido p 
JOIN 



WHERE p.importe > 150;





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

--1. Mostrar la suma de les quotes i la suma de les vendes totals de tots els representants.

SELECT SUM(cuota) "Total Cuota", SUM(ventas) "Total Sels"
FROM repventa;



--2. Quin és l'import total de les comandes preses per Bill Adams?

SELECT ROUND(SUM(p.importe),2)||'€' "Total Import" 
FROM pedido p
JOIN repventa r ON p.repcod = r.repcod
WHERE LOWER(r.nombre)='bill adams';


--3. Calcula el preu mitjà dels productes del fabricant “aci”.
SELECT *
FROM cliente 
WHERE LOWER(nombre) = 'aci' 
/*
4. Quin és l'import mitjà de la comanda sol·licitada pel client "acme mfg."

5. Mostrar la quota màxima i la quota mínima de les quotes dels representants.

6. Quina és la data de la comanda més antiga que es té registrada?

7. Quin és el millor rendiment de vendes de tots els representants? (considerar-ho com el percentatge de vendes sobre la quota).



8. Quants clients té lempresa?

9. Quants representants han obtingut un import de vendes superior a la seva pròpia quota?

10. Quantes comandes s'han pres de més de 150 euros?

11. Troba el nombre total de comandes, l'import mitjà, l'import total dels mateixos.

12. Quants llocs de treball diferents hi ha a l'empresa?

13. Quantes oficines tenen representants que superen les seves pròpies quotes?

14. Quin és l'import mitjà de les comandes preses per cada representant?

15. Quin és el rang de les quotes dels representants assignats a cada oficina (mínim i màxim)?

16. Quants representants hi ha assignats a cada oficina? Mostra Ciutat i nombre de representants.

17. Quants clients ha contactat per primer cop cada representant? Mostra el codi de representant, nom i número de clients.

18. Calcula el total de l'import de les comandes sol·licitades per cada client a cada representant.

19. Llista l'import total de les comandes preses per cada representant.

20. Per a cada oficina amb dos o més representants, calculeu el total de les quotes i el total de les vendes de tots els representants.

21. Mostra el nombre de comandes que superen el 75% de les existències.
*/

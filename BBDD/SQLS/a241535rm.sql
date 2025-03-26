-- Ricardo Moreno Ianiva
-- a241535rm.sql


--1
SELECT p.codpeli , d.coddvd , titol , nom , cognoms , datapres 
FROM LLOGUER l 
JOIN SOCI s ON l.codsoci = s.codsoci    
JOIN dvd d ON l.coddvd = d.coddvd
JOIN pelicula p ON d.codpeli = p.codpeli
ORDER BY 1,6;



--2
SELECT s.codsoci , s.nom || ', ' || s.cognoms "Soci" , COALESCE(COUNT(datapres),0) "Prestecs Realitzats" , SUM(import) || ' €' "Despesa"
FROM LLOGUER l
RIGHT JOIN SOCI s ON l.codsoci = s.codsoci
GROUP BY s.nom,s.codsoci , s.cognoms
ORDER BY (4 ,3 , s.) DESC AND ORDER BY s.cognoms ASC;

--3
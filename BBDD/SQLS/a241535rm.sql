-- Ricardo Moreno Ianiva
-- a241535rm.sql

SELECT p.codpeli , d.coddvd , titol , nom , cognoms , datapres 
FROM LLOGUER l 
JOIN SOCI s ON l.codsoci = s.codsoci    
JOIN dvd d ON l.coddvd = d.coddvd
JOIN pelicula p ON d.codpeli = p.codpeli
ORDER BY 1,6;


SELECT COUNT(datapres) , CodSOCI , 

FROM LLOGUER;
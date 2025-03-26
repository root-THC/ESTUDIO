-- Ricardo Moreno Ianiva
-- a241535rm.sql

SELECT codpeli , coddvd , titol , nom , cognoms datapres 
FROM LLOGUER l
JOIN dvd d ON l.coddvd = d.coddvd
JOIN pelicula p ON d.codpeli = p.codpeli
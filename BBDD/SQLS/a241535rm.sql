-- Ricardo Moreno Ianiva
-- a241535rm.sql

SELECT codpeli , coddvd , titol , nom , cognoms datapres 
FROM LLOGUER l
JOIN dvd d ON l.coddvd=
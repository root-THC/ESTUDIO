--RICARDO MORENO IANIV
--a241535rm

\c template1
DROP DATABASE IF EXISTS clubnautic;
CREATE DATABASE clubnautic;
\c clubnautic

CREATE SEQUENCE numSoci_seq
  START WITH 1
  INCREMENT BY 1;


CREATE TABLE Vaixell (
    matricula SMALLINT,
    soci SMALLINT,
    nomVaixell VARCHAR(40),
    numAmarre NUMERIC (4,0),
    quota NUMERIC (7,2),
    CONSTRAINT nomVaixell_uk UNIQUE (nomVaixell),
    CONSTRAINT vaixell_matricula_pk PRIMARY KEY (matricula)
);
CREATE TABLE Usuari (
    DNI CHAR (9),
    telefon CHAR (13),
    email VARCHAR(40),
    tipus VARCHAR(1) CHECK (tipus IN ('A', 'B','C')),
    dataAlta DATE ,
    numSoci SMALLINT,  
    ciutat VARCHAR(40),
    CONSTRAINT usuari_dni_pk PRIMARY KEY (DNI)
);
CREATE TABLE Sortida (
        dataSortida TIMESTAMP CONSTRAINT dataSortida_dataRetorn_ck CHECK (dataSortida < dataRetorn), 
        Vaixell SMALLINT,
        Patro VARCHAR(40),
        dataRetorn DATE,
        destinacio VARCHAR(40),
        CONSTRAINT sortida_dataSortida_Vaixell_pk PRIMARY KEY (dataSortida,Vaixell),
        CONSTRAINT sortida_Vaixell_fk FOREIGN KEY (Vaixell) REFERENCES vaixell(matricula) ON DELETE CASCADE
);




INSERT INTO usuari VALUES ('42234565H','656764234+32','a@gmail.com','A',TO_DATE('17-10-1980', 'DD-MM-YYYY'),NEXTVAL('numSoci_seq'),'Barcelona');
INSERT INTO usuari VALUES ('45155090F','656764234+32','x@gmail.com','B',TO_DATE('06-12-2000', 'DD-MM-YYYY'),NEXTVAL('numSoci_seq'),'Barcelona');

DELETE FROM usuari WHERE lower(ciutat) = 'barcelona' AND () ;
--DELETE FROM Usuari WHERE tipus = 'A'

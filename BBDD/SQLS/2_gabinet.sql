\c template1
DROP DATABASE IF EXISTS gabinet;
CREATE DATABASE gabinet;
\c gabinet

--DROP TABLE assumptexprocurador;
--DROP TABLE procurador;
--DROP TABLE assumpte;
--DROP TABLE client;

CREATE TABLE client (
        dni CHAR(9) CONSTRAINT client_dni_pk PRIMARY KEY,
        nomclient VARCHAR(20),
        adreca VARCHAR(40),
        telefon VARCHAR(13) -- telefonos internacionales 
);

CREATE TABLE procurador (
        dniProcurador CHAR(9) CONSTRAINT procurador_dni_pk PRIMARY KEY,
        nomP VARCHAR(20),
        adreca VARCHAR(40),
        telefon VARCHAR(13), -- telefonos internacionales 
        CONSTRAINT procurador_nomP_uk UNIQUE(nomP)
);

CREATE TABLE assumpte (
        numExpedient CHAR(9) CONSTRAINT assumpte_numExpedient_pk PRIMARY KEY,
        dataInici DATE,
        dataArxiu DATE,
        estat VARCHAR(20) CHECK (estat IN ('obert', 'tancat')),
        dni CHAR(9),
        CONSTRAINT fk_client FOREIGN KEY (dni) REFERENCES client(dni) 
	ON UPDATE CASCADE
);

CREATE TABLE assumptexprocurador (  
    numExpedient CHAR(9),
    dniProcurador CHAR(9),
    CONSTRAINT assumpteXprocurador_composta_fk PRIMARY KEY (numExpedient, dniProcurador), 
    --Claves Foráneas
    CONSTRAINT fk_assumpte FOREIGN KEY (numExpedient) REFERENCES assumpte(numExpedient)
	ON UPDATE CASCADE,
    CONSTRAINT fk_procurador FOREIGN KEY (dniProcurador) REFERENCES procurador(dniProcurador)
	ON UPDATE CASCADE
);

-- REGISTRO CLIENT
INSERT INTO client VALUES ('12345678N','Mario Perez Heredia','Calle de los Pecadores 1º2ª','+34665812435');
INSERT INTO client VALUES ('23456789H','Julio Lopez Abedul','Avenida Saturno 22','+34686781154');
INSERT INTO client VALUES ('45678945P','Mohammed Hmed Ladil','Plaza Ovideo 4º2ª','-212718754389');

-- PROCURADOR
INSERT INTO procurador VALUES ('34567898Y','Mario Perez Heredia','Calle de los Pecadores 1º2ª','+34665812435');
INSERT INTO procurador VALUES ('78654321L','Julio Lopez Abedul','Avenida Saturno 22','+34686781154');
INSERT INTO procurador VALUES ('98765432A','Mohammed Hmed Ladil','Plaza Ovideo 4º2ª','-212718754389');

-- REGISTRO ASSUMPTE
INSERT INTO assumpte VALUES ('2','2024-11-28',NULL,'obert','12345678N');
INSERT INTO assumpte VALUES ('3','2024-11-28','2024-12-02','tancat','23456789H');
INSERT INTO assumpte VALUES ('1',CURRENT_DATE - INTERVAL '15 days',NULL,'obert','45678945P');

-- REGISTRO ASSUMPTEXPROCURADOR
INSERT INTO assumptexprocurador VALUES ('1','34567898Y');
INSERT INTO assumptexprocurador VALUES ('2','78654321L');
INSERT INTO assumptexprocurador VALUES ('3','98765432A');


-- EXERCICI 17 ENERO CASCADE NULL etc.. 17 ENERO
--1
-- EN la tabla assumpte
--CONSTRAINT fk_client FOREIGN KEY (dni) REFERENCES client(dni) 
	--ON DELETE SET NULL
--DELETE FROM client WHERE nomclient='Mario Perez Heredia';
--SELECT * FROM client;
--SELECT * FROM assumpte;


--2

--En la tabla assumptexprocurador
--CONSTRAINT fk_assumpte FOREIGN KEY (numExpedient) REFERENCES assumpte(numExpedient)
        --ON DELETE CASCADE,
--DELETE FROM assumpte WHERE numexpedient='2';
--SELECT * FROM assumpte;
--SELECT * FROM assumptexprocurador;



--3
--En la clave aliena assumptexprocurador
--CONSTRAINT fk_procurador FOREIGN KEY (dniProcurador) REFERENCES procurador(dniProcurador)
        --ON DELETE CASCADE
--DELETE FROM procurador WHERE dniprocurador=34567898Y;
--SELECT * FROM procurador;
--SELECT * FROM assumptexprocurador;

--4

--Tabla procurador
--CONSTRAINT fk_client FOREIGN KEY (dni) REFERENCES client(dni) 
--        ON UPDATE CASCADE
-- Tabla assumptexprocurador
-- CONSTRAINT fk_assumpte FOREIGN KEY (numExpedient) REFERENCES assumpte(numExpedient) 
--        ON UPDATE CASCADE,
--    CONSTRAINT fk_procurador FOREIGN KEY (dniProcurador) REFERENCES procurador(dniProcurador)
--        ON UPDATE CASCADE

--UPDATE procurador SET dniprocurador= '45155789F' WHERE dniprocurador='34567898Y';
--SELECT * FROM procurador;
--SELECT * FROM assumptexprocurador;




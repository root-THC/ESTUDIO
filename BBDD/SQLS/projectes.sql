\c template1
DROP DATABASE IF EXISTS projecte;
CREATE DATABASE projecte;
\c projecte

CREATE TABLE departament (
        id_Departament INT CONSTRAINT id_departament_pk PRIMARY KEY,
        nom VARCHAR(40)
);
CREATE SEQUENCE seq_idDepartament;

CREATE TABLE projecte (
        id_Projecte INT CONSTRAINT id_Projecte_pk PRIMARY KEY,
	titol VARCHAR(40),
	durada VARCHAR(20),
        pressupost VARCHAR(15),
	dni CHAR(9)
	
-- FALTA LA FK DE dni empleat
);
CREATE SEQUENCE seq_idProjecte;



CREATE TABLE empleat (
       	dni CHAR(9) CONSTRAINT empleat_dni_pk PRIMARY KEY,
        nom VARCHAR(40),
        adreca VARCHAR(40),
        telefon VARCHAR(13),
	id_Cap CHAR(9),
	id_Departament INT,
	id_Projecte INT,
CONSTRAINT fk_departament FOREIGN KEY (id_Departament) REFERENCES departament(id_Departament),
CONSTRAINT fk_projecte FOREIGN KEY (id_Projecte) REFERENCES projecte(id_Projecte),
CONSTRAINT fk_Cap FOREIGN KEY (id_Cap) REFERENCES empleat(dni)
);
	
ALTER TABLE projecte
	ADD CONSTRAINT fk_projecte_dni FOREIGN KEY (dni) REFERENCES empleat(dni);



-- REGISTROS

INSERT INTO departament VALUES (NEXTVAL('seq_idDepartament'), 'Marketing');
INSERT INTO empleat VALUES ('11223344C', 'Laura Martínez', 'Paseo del Prado 15', '678901234', '11223344C', CURRVAL('seq_idDepartament'), NULL);
INSERT INTO departament VALUES (NEXTVAL('seq_idDepartament'), 'Finanzas');
INSERT INTO empleat VALUES ('55667788D', 'David Sánchez', 'Calle Libertad 20', '612345678', '11223344C', CURRVAL('seq_idDepartament'), NULL);


INSERT INTO projecte VALUES (NEXTVAL('seq_idProjecte'), 'Campaña Publicitaria', '2024-09-01', '20000', '11223344C');
INSERT INTO projecte VALUES (NEXTVAL('seq_idProjecte'), 'Análisis Financiero', '2025-01-15', '25000', '55667788D');

SELECT ename FROM emp WHERE LOWER(ename)
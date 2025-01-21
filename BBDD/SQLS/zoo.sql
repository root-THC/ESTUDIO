\c template1
DROP DATABASE IF EXISTS zoo;
CREATE DATABASE zoo;
\c zoo

CREATE TABLE zoo (
       	id_Zoo SMALLINT CONSTRAINT id_Zoo_pk PRIMARY KEY,
        nom VARCHAR(40),
        ciutat VARCHAR(40),
        pais VARCHAR(40), 
	mida VARCHAR(30),
	pressupost_anual NUMERIC(10,2)
);

CREATE TABLE especie (
        id_Especie INT CONSTRAINT id_Especie_pk PRIMARY KEY,
        nom_vulgar VARCHAR(40),
        nom_cientific VARCHAR(40),
        familia VARCHAR(40), 
	extincio BOOLEAN          
);

CREATE TABLE animal (
        id_Animal INT,
	id_Zoo SMALLINT,
	id_especie INT,
        sexe VARCHAR(15) CONSTRAINT animal_sexe_ck CHECK (sexe IN ('mascle', 'femella', 'no aplica', 'hemafrodita')),
        any_naixement DATE, 
        pais_origen VARCHAR(15),
        continent VARCHAR(20),	
	CONSTRAINT animal_idAnimal_idZoo_pk PRIMARY KEY (id_Animal,id_Zoo),
        CONSTRAINT fk_zoo FOREIGN KEY (id_Zoo) REFERENCES zoo(id_Zoo),
	CONSTRAINT fk_especie FOREIGN KEY (id_Especie) REFERENCES especie(id_Especie)
);

-- REGISTROS

INSERT INTO zoo VALUES 
(1, 'Parque Nacional Kruger', 'Mpumalanga', 'Sudáfrica', '30.000 m2', 4500000.50),
(2, 'Zoo Aquarium de Madrid', 'Madrid', 'España', '25.000 m2', 3200000.00),
(3, 'Singapore Zoo', 'Singapur', 'Singapur', '10.000 m2', 2500000.75);

INSERT INTO especie VALUES
(1, 'Tucán de Pico Iris', 'Ramphastos sulfuratus', 'Ramphastidae', FALSE),
(2, 'Lémur de Cola Anillada', 'Lemur catta', 'Lemuridae', TRUE),
(3, 'Dragón de Komodo', 'Varanus komodoensis', 'Varanidae', FALSE);

INSERT INTO animal VALUES 
(1, 1, 1, 'femella', '2017-01-01', 'Costa Rica', 'América'),
(2, 2, 2, 'mascle', '2010-01-01', 'Madagascar', 'África'),
(3, 3, 3, 'mascle', '2015-01-01', 'Indonesia', 'Asia');

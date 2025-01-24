\c template1
DROP DATABASE IF EXISTS cinefil;
CREATE DATABASE cinefil;
\c cinefil

CREATE SEQUENCE pelicula_seq
    START WITH 1
    INCREMENT BY 1;

CREATE SEQUENCE director_seq
    START WITH 1
    INCREMENT BY 1;

CREATE SEQUENCE tema_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE pelicula (
    IdPeli SMALLINT,
    Titol VARCHAR(20),
    Estreno DATE,
    Presupuesto NUMERIC(7, 2),
    CONSTRAINT pelicula_id_pk PRIMARY KEY (IdPeli),
    CONSTRAINT pelicula_uk UNIQUE(Titol),
    CONSTRAINT pelicula_companyia_fk FOREIGN KEY (IdCompanyia) REFERENCES companyia(IdCompanyia), --Seran alters luego
    CONSTRAINT pelicula_tema_fk FOREIGN KEY (IdTema) REFERENCES tema(IdTema) --Seran alters luego
);
CREATE TABLE director (
    IdDirector SMALLINT,
    NomDirector VARCHAR(40),
    CONSTRAINT director_id_pk PRIMARY KEY (IdDirector)
);
CREATE TABLE directorxpelicula (
    IdDirector SMALLINT,
    IdPeli SMALLINT,
    CONSTRAINT directorxpelicula_IdPeli_IdDirector_pk PRIMARY KEY (IdPeli,IdDirector),
    CONSTRAINT directorxpelicula_IdDirector_fk FOREIGN KEY (IdDirector) REFERENCES director(IdDirector),
    CONSTRAINT directorxpelicula_IdPeli_fk FOREIGN KEY (IdPeli) REFERENCES pelicula(IdPeli)
);
CREATE TABLE tema (
    IdTema SMALLINT,
    NomTema VARCHAR(40),
    CONSTRAINT tema_id_pk PRIMARY KEY (IdTema)
);

CREATE TABLE actor (
    IdActor SMALLINT,
    NomActor VARCHAR(40),
    FechaNacimiento DATE,
    CONSTRAINT actor_id_pk PRIMARY KEY (IdActor)
);

CREATE TABLE actorxtema (
    IdActor SMALLINT,
    IdTema SMALLINT,
    CONSTRAINT actorxtema_IdActor_IdTema_pk PRIMARY KEY (IdPeli,IdDirector),
    CONSTRAINT actorxtema_IdActor_fk FOREIGN KEY (IdActor) REFERENCES actor(IdActor),
    CONSTRAINT actorxtema_IdTema_fk FOREIGN KEY (IdTema) REFERENCES tema(IdTema)
);


CREATE TABLE companyia (
    IdCompanyia SMALLINT,
    NomCompanyia VARCHAR(40),   
    CONSTRAINT companyia_id_pk PRIMARY KEY (IdCompanyia)   
);

CREATE TABLE ciutat (
    IdCiutat SMALLINT,
    NomCiutat VARCHAR(40),
    CONSTRAINT ciutat_id_pk PRIMARY KEY (IdCiutat)
);
CREATE TABLE ciutatxcompanyia (
    IdCiutat SMALLINT,
    IdCompanyia SMALLINT,
    CONSTRAINT ciutatxcompanyia_id_pk PRIMARY KEY (IdCiutat,IdCompanyia),
    CONSTRAINT ciutatxcompanyia_IdCiutat_fk FOREIGN KEY (IdCiutat) REFERENCES ciutat(IdCiutat),
    CONSTRAINT ciutatxcompanyia_IdCompanyia_fk FOREIGN KEY (IdCompanyia) REFERENCES companyia(IdCompanyia)
);
CREATE TABLE paper (
    IdPaper SMALLINT,
    NomPaper VARCHAR (40),
    CONSTRAINT paper_id_pk PRIMARY KEY (IdPaper)
);
CREATE TABLE actorxsubstitucio (
    IdActor SMALLINT,
    IdActorSubsitut SMALLINT,
    Grau ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    CONSTRAINT actorxsubstitucio_id_pk PRIMARY KEY (IdActor,IdActorSubsitut),
    CONSTRAINT actorxsubstitucio_IdActor_fk FOREIGN KEY (IdActor) REFERENCES actor(IdActor)
);
CREATE TABLE actorxcompatibilitat (
    IdActor SMALLINT,
    IdActorCompatible SMALLINT,
    Compatible BOOLEAN,
    CONSTRAINT actorxcomptabilitat_id_pk PRIMARY KEY (IdActor,IdActorCompatible)
);

CREATE TABLE data (
    DataInici DATE DEFAULT CURRENT_DATE,
    CONSTRAINT data_DataInici_pk PRIMARY KEY (DataInici)
);
CREATE TABLE actorxcompanyiaxdata (
    IdActor SMALLINT,
    DataInici DATE DEFAULT CURRENT_DATE,
    IdCompanyia SMALLINT,
    DataFi DATE,
    CONSTRAINT actorxcompanyiaxdata_pk PRIMARY KEY (IdActor,DataInici,IdCompanyia),
    CONSTRAINT actorxcompanyiaxdata_IdActor_fk FOREIGN KEY (IdActor) REFERENCES actor(IdActor),
    CONSTRAINT actorxcompanyiaxdata_DataInici_fk FOREIGN KEY (DataInici) REFERENCES data(DataInici),
    CONSTRAINT actorxcompanyiaxdata_IdCompanyia_fk FOREIGN KEY (IdCompanyia) REFERENCES companyia(IdCompanyia)
);
CREATE TABLE actorxpaperxpelicula (
    IdActor SMALLINT,
    IdPeli SMALLINT,
    IdPaper SMALLINT,
    CONSTRAINT actorxpaperxpelicula_pk PRIMARY KEY (IdActor,IdPeli,IdPaper),
    CONSTRAINT actorxpaperxpelicula_IdActor_fk FOREIGN KEY (IdActor) REFERENCES actor(IdActor),
    CONSTRAINT actorxpaperxpelicula_IdPeli_fk FOREIGN KEY (IdPeli)  REFERENCES  pelicula(IdPeli),
    CONSTRAINT actorxpaperxpelicula_IdPaper_fk FOREIGN KEY (IdPaper) REFERENCES paper(IdPaper)
);
CREATE TABLE datarodatje (
    DataIniciRodatje DATE,
    CONSTRAINT datarodatje_DataIniciRodatje_pk PRIMARY  KEY (DataIniciRodatje)
);
CREATE TABLE faserodatje (
    IdPeli SMALLINT,
    IdCiutat SMALLINT,
    DataIniciRodatje DATE,
    CONSTRAINT faserodatje_pk PRIMARY  KEY (IdPeli,IdCiutat,DataIniciRodatje),
    CONSTRAINT faserodatje_IdPeli_fk FOREIGN KEY (IdPeli)  REFERENCES  pelicula(IdPeli),
    CONSTRAINT faserodatje_IdCiutat_fk FOREIGN KEY (IdCiutat)  REFERENCES  ciutat(IdCiutat),
    CONSTRAINT faserodatje_DataIniciRodatje_fk FOREIGN KEY (IdPeli)  REFERENCES  datarodatje(DataIniciRodatje)

);
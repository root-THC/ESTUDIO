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
    CONSTRAINT pelicula_companyia_fk FOREIGN KEY (IdCompanyia) REFERENCES Companyia, --Seran alters luego
    CONSTRAINT pelicula_tema_fk FOREIGN KEY (IdTema) REFERENCES Tema --Seran alters luego
);
CREATE TABLE director (
    IdDirector SMALLINT,
    NombreDirector VARCHAR(40),
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
    Nombre VARCHAR(40),
    FechaNacimiento DATE,
    CONSTRAINT director_id_pk PRIMARY KEY (IdActor)
);

CREATE TABLE actorxtema (
    IdActor SMALLINT,
    IdTema SMALLINT,
    CONSTRAINT actorxtema_IdActor_IdTema_pk PRIMARY KEY (IdPeli,IdDirector),
    CONSTRAINT actorxtema_IdActor_fk FOREIGN KEY (IdActor) REFERENCES actor(IdActor),
    CONSTRAINT actorxtema_IdTema_fk FOREIGN KEY (IdTema) REFERENCES tema(IdTema)
);


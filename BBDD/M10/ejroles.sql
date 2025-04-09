--Ejercicio 1: Crear roles con y sin login

--1.1. Crear usuario ana con contraseña y con login

CREATE ROLE ana WITH LOGIN PASSWORD '1234';



--1.2. Crear rol de grupo "desarrolladores" (sin login)

CREATE ROLE desarrolladores NOLOGIN;

--1.3. Añadir el usuario al grupo 

GRANT desarrolladores TO ana; 


--2. Crear esquemas y asignar propietario





--2.1. Crear esquema llamado "proyecto" propiedad del rol desarrolladores

CREATE SCHEMA proyecto AUTHORIZATION desarrolladores;


--3. Controlar privilegios en el esquema



--3.1. Permitir uso y creación de objetos en el esquema desarrolladores

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA proyecto TO desarrolladores;





--3.2. Revocar permisos públicos

REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM public;






--4. Asignar permisos sobre tablas

--4.1. Crear la tabla clientes dentro del esquema proyecto

CREATE TABLE proyecto.clientes ( id SERIAL PRIMARY KEY,  nombre TEXT,  email TEXT);


--La estructura es:   id SERIAL PRIMARY KEY,  nombre TEXT,  email TEXT



--4.2. Crear rol usuario_consulta solo

CREATE ROLE usuario_consulta LOGIN;

/*
4.3. Dar permisos de lectura sobre la tabla cliente al usuario_consulta

 5. Cambio de role sin tener que salir de la sesion

5.1. Cambiar al rol ana

5.2. Crear una tabla llamada "prueba" dentro del esquema proyecto como ana

5.3. Volver al rol original
*/

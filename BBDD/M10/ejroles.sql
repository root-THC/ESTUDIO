--Ejercicio 1: Crear roles con y sin login

--1.1. Crear usuario ana con contraseña y con login

CREATE ROLE ana WITH LOGIN PASSWORD '1234';



--1.2. Crear rol de grupo "desarrolladores" (sin login)

CREATE ROLE dessarr



/*
1.3. Añadir el usuario al grupo 


2. Crear esquemas y asignar propietario

2.1. Crear esquema llamado "proyecto" propiedad del rol desarrolladores


3. Controlar privilegios en el esquema

3.1. Permitir uso y creación de objetos en el esquema desarrolladores
3.2. Revocar permisos públicos

4. Asignar permisos sobre tablas

4.1. Crear la tabla clientes dentro del esquema proyecto

La estructura es:   id SERIAL PRIMARY KEY,  nombre TEXT,  email TEXT

4.2. Crear rol usuario_consulta solo para lectura
4.3. Dar permisos de lectura sobre la tabla cliente al usuario_consulta

 5. Cambio de role sin tener que salir de la sesion

5.1. Cambiar al rol ana

5.2. Crear una tabla llamada "prueba" dentro del esquema proyecto como ana

5.3. Volver al rol original
*/

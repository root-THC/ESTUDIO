# APUNTES BBDD

## Operadores de Comparación


| Operador  | Descripción                          |
|-----------|--------------------------------------|
| `=`       | Igual                               |
| `!=`      | Diferente                           |
| `>`       | Mayor que                           |
| `<`       | Menor que                           |
| `>=`      | Mayor o igual                       |
| `<=`      | Menor o igual                       |
| `BETWEEN` | Para valores dentro de un rango     |
| `LIKE`    | Para búsqueda de patrones usos: |
| |`%` : Representa cero o más caracteres|
|| `_` : Representa un único carácter.| 
| `IN` / `NOT IN`      | Para comparar con una lista de valores |
| `IS NULL` / `IS NOT NULL` | Para comprobar valores nulos |

---

## Operadores Lógicos
 Operador  | Descripción                          |
|-----------|--------------------------------------|
| `AND`       |  **TRUE** si ambas condiciones  **TRUE**|
| `OR`      | **TRUE** si alguna de las condiciones es **TRUE** |            
| `NOT`       | **TRUE** si la condición es **FALSA**     |

---

## Tipos de Datos en SQL

| Tipo de Dato        | Descripción                                      |
|----------------------|------------------------------------------------|
| `VARCHAR(numbytes)`  | Texto con longitud variable hasta `numbytes`.  |
| `INT (4 bytes)`      | Número entero                                  |
| `SMALLINT (2 bytes)` | Número entero pequeño                         |
| `BIGINT (8 bytes)`   | Número entero grande                          |
| `NUMERIC(E,D)`       | Número con parte decimal fija                 |
| **Ejemplos**          
| `NUMERIC(5,2)`      | De `000,00` hasta `999,99` |
| `BOOLEAN`           | Valores `TRUE` o `FALSE`                      |
| `DATE`              | Fecha (`día, mes, año`)                       |
| `TIMESTAMP`         | Fecha y hora (`día, mes, año, horas, minutos, segundos`) |

---

## Comandos PSQL

| Comando             | Descripción |
|---------------------|------------|
| `\l`               | Lista las bases de datos del servidor. |
| `\c base_datos`    | Cambia la conexión a `base_datos`. |
| `\d`               | Muestra los objetos dentro de la base de datos actual. |
| `\dp`               | Mostrar los privilegios que tienen los usuarios sobre los objetos. |
| `\dt`              | Muestra solo las tablas. |
| `\d nombre_tabla`  | Muestra la estructura de `nombre_tabla`,|
| `\dv`              | Muestra las vistas existentes. |
| `\d nombre_vista`  | Muestra la estructura de `nombre_vista`|
| `\x`              | Cambiar display por si se ve mal. |
| `\ds`              | Muestra las secuencias. |
| `\dn`              | Muestra los esquemas. |
| `\di`              | Muestra los índices de PostgreSQL. |
| `\du`              | Muestra usuarios y roles de estos. |
| `\df`              | Mostrar las funciones creadas. |
| `\h`              |  Ordenes SQL. Ej: DROP DATABASE; etc..|
| `\h comando`              |  Muestra ayudas de como funciona el comando o la estructura|
| `\?`              | Ordenes PSQL. Ej: \di etc...|
| `\i`              | Ejecutar script|


---

## Creación de Base de Datos

```sql
\c template1
DROP DATABASE IF EXISTS base_datos_1;
CREATE DATABASE base_datos_1;
\c base_datos_1
```

---

## Creación de Secuencias

```sql
-- CREAR EN TABLA
CREATE SEQUENCE secuencia_1 START WITH 1 INCREMENT BY 1;

-- USARLO EN INSERT
INSERT INTO tabla VALUES (NEXTVAL('secuencia_1') , valor1 , valor2);

```

---

## Creación de Tablas

### Definición de Tablas

```sql
CREATE TABLE tabla_1 (
    id_tabla1 SMALLINT,
    campo_1 VARCHAR(20) UNIQUE,
    campo_2 DATE,
    campo_3 NUMERIC(7,2),
    CONSTRAINT tabla_1_id_pk PRIMARY KEY (id_tabla1)
);

CREATE TABLE tabla_2 (
    id_tabla2 SMALLINT,
    campo_1 VARCHAR(40),
    diferentes_valores CHECK (tipus IN ('A', 'B','C')), 
    -- A , B , C són los únicos valores que se pueden asignar a este campo
    CONSTRAINT tabla_2_id_pk PRIMARY KEY (id_tabla2)
);


--CLAVE PRIMÁRIA COMPUESTA

CREATE TABLE tabla_3 (
    id_tabla3 SMALLINT,
    campo_1 VARCHAR(40),
    CONSTRAINT tabla_3_id_pk PRIMARY KEY (id_tabla3)
);

CREATE TABLE tabla_4 (
    id_tabla4 SMALLINT,
    campo_1 VARCHAR(40),
    fecha DATE,
    CONSTRAINT tabla_4_id_pk PRIMARY KEY (id_tabla4)
);

CREATE TABLE tabla_relacion (
    id_tabla3 SMALLINT,
    id_tabla4 SMALLINT,
    CONSTRAINT tabla_relacion_pk PRIMARY KEY (id_tabla3, id_tabla4),
    CONSTRAINT tabla_relacion_fk_t3 FOREIGN KEY (id_tabla3) REFERENCES tabla_3(id_tabla3),
    CONSTRAINT tabla_relacion_fk_t4 FOREIGN KEY (id_tabla4) REFERENCES tabla_4(id_tabla4)
);
```

---

## Inserción de Datos

```sql
INSERT INTO tabla_1 VALUES (1, 'Ejemplo 1', '2024-11-28', 50000.00);
INSERT INTO tabla_1 VALUES (2, 'Ejemplo 2', '2024-11-29', 75000.00);

INSERT INTO tabla_2 VALUES (1, 'Dato 1', 'A');
INSERT INTO tabla_2 VALUES (2, 'Dato 2', 'B');

INSERT INTO tabla_3 VALUES (1, 'Categoria 1');
INSERT INTO tabla_3 VALUES (2, 'Categoria 2');

INSERT INTO tabla_4 VALUES (1, 'Elemento 1', '2024-12-01');
INSERT INTO tabla_4 VALUES (2, 'Elemento 2', '2024-12-02');

INSERT INTO tabla_relacion VALUES (1, 1);
INSERT INTO tabla_relacion VALUES (2, 2);
```

---

## Restricciones y Cascade | DELETE | UPDATE | 

### `Por defecto ` 
Cuando no específicamos nada en el CONSTRAINT con lo cual no se ve pero es RESTRICT lo cual bloquea cualquier cambio y da error.

### `SET NULL` 

TABLA A > TABLA B > TABLA C

Cuando se aplica una restricción a una **clave ajena** en `tabla_c`, los registros relacionados en `A Y B` su **clave ajena** pasará a ser `NULL`.

```sql
DELETE FROM tabla_c WHERE id='2';
```

### `CASCADE`

Cuando se aplica una restricción a una **clave ajena** en `tabla_c`, los registros dependientes en `A Y B` también se aplica en caso de que sea delete se borran en `A Y B`  y en caso de update se actualizan en `A Y B`  .

```sql
-- EJEMPLO : 

TABLA A > TABLA B > TABLA C

DELETE FROM tabla_c WHERE id='2';

Se borraran todos los registros que haya tanto en B como en A que esten relacionados con id 2 de la tabla c
```

### `ON UPDATE CASCADE`

Cuando se actualiza la **clave primaria** de un registro en `tabla_2`, las claves foráneas en `tabla_intermedia` se actualizaran automáticamente a ese nuevo valor.

```sql
TABLA A > TABLA B > TABLA C

UPDATE tabla_c SET id= 3 WHERE id=2;
```

## Funciones de Agrupación

| **Función**  | **Descripción**                          |
|-----------|--------------------------------------|
| `COUNT(*)`       | Contamos num de registros "Solo lo hará con las que tienen un valor"     |
| `AVG(campo)`      | Hacemos la media             |
| `MAX(campo)`       | Muestra el valor máximo de ese **campo** |
| `MIN(campo)`      | Muestra el valor mínimo de ese **campo** |
| `SUM(campo)`      | Suma los valores de ese **campo** |
| **Ejemplos** 
| `COUNT`      | SELECT COUNT(**campo**); |
| `AVG`           | SELECT AVG(**campo**) FROM **tabla**;|
| `MAX`              | SELECT MAX(**campo**) FROM  **tabla**;|
| `MIN`         | SELECT MIN(**campo**) FROM  **tabla**;|
| `SUM`         | SELECT SUM(**campo**) FROM  **tabla**;|

---

## JOINS en SQL 
```sql
En SQL, un JOIN se usa para combinar filas de dos o más tablas basándose en una columna relacionada entre ellas.
```

## `JOIN (INNER JOIN)`
Devuelve solo las filas donde hay coincidencia en ambas tablas.

```sql
SELECT e.ename, e.job, d.dname 
FROM emp e

INNER JOIN dept d ON e.deptno = d.deptno;

-- SIN INNER : ES LO MISMO!!

JOIN dept ON e.deptno = d.deptno;
```

### Ejemplo Explicado:
---
Suponiendo que tenemos una tabla `emp` con empleados y una tabla `dept` con departamentos, \
este INNER JOIN traerá solo los empleados que tienen un departamento asignado en ambas tablas.

"No hace falta específicar el `INNER`"

## `LEFT JOIN (LEFT OUTER JOIN)`
---
Devuelve todas las filas de la tabla de la izquierda y las coincidentes de la tabla de la derecha. \
Si no hay coincidencia, devuelve NULL en las columnas de la tabla derecha.

```sql
SELECT e.ename, e.job, d.dname 
FROM emp e
LEFT JOIN dept d ON e.deptno = d.deptno;
```

### Ejemplo Explicado:
---
LEFT = `emp`
```sql
-- Muestra todos los empleados, incluso si no tienen un departamento asignado  o el valor es NULL
```

## `RIGHT JOIN (RIGHT OUTER JOIN)`
Devuelve todas las filas de la tabla de la derecha y las coincidentes de la tabla de la izquierda. \
Si no hay coincidencia, devuelve NULL en las columnas de la tabla izquierda.

```sql
SELECT e.ename, e.job, d.dname 
FROM emp e
RIGHT JOIN dept d ON e.deptno = d.deptno;
```

### Ejemplo Explicado:
RIGHT = `dept`
```sql
-- Muestra todos los departamentos, incluso si no tienen empleados asignados o el valor es NULL
```

## `FULL JOIN (FULL OUTER JOIN)`
Devuelve todas las filas cuando hay coincidencia en cualquiera de las tablas.
Si no hay coincidencia en una tabla, se devuelve NULL en su lugar.

```sql
SELECT e.ename, e.job, d.dname 
FROM emp e
FULL JOIN dept d ON e.deptno = d.deptno;
```

### Ejemplo Explicado:
```sql
-- Muestra todos los empleados y todos los departamentos.
-- Si un empleado no tiene departamento, `dname` será NULL.
-- Si un departamento no tiene empleados, `ename` será NULL.
```

## `CROSS JOIN`
Devuelve el producto cartesiano de ambas tablas \
(cada fila de la primera se combina con cada fila de la segunda tabla).

```sql
SELECT e.ename, d.dname 
FROM emp e
CROSS JOIN dept d;
```

### Ejemplo Explicado:
```sql
-- Si hay 10 empleados y 4 departamentos, el resultado tendrá 10 × 4 = 40 filas.
```
## `SELF JOIN`
Un SELF JOIN es un JOIN de una tabla consigo misma.

```sql
SELECT e1.ename "Empleado", e2.ename "Jefe" 
FROM emp e1
JOIN emp e2 ON e1.mgr = e2.empno;
```

### Ejemplo Explicado:
```sql
-- Une la tabla `emp` consigo misma para encontrar quién es el jefe de cada empleado.
```
---


## TRANSACCIONES 

- **DEFINICIÓN** = Ordenes para poder poder  deshacer cambios hechos por operadores **DML** o volver a check points creados dentro de una transacción 

- **DML** *= INSERT | UPDATE | DELETE* 

- **DATO** = Internamente cuando usamos una operación **DML** hacen un begin y commit por lo tanto si no estamos dentro de una transacción no lo  podemos recuperar.

- Si hay cualquier tipo de `ERROR` nos deshace todo y nos hace un rollback automáticamente

`EJEMPLO ERROR`

`scott=*>` INSTERT INTO emp (1244,'jordi');\
ERROR:  syntax error at or near "INSTERT"\
LINE 1: INSTERT INTO emp (1244,'jordi');\
`scott=!>` \
Como podemos ver el símbolo cambia por una `EXCLAMACIÓN` si hacemos un `COMMIT;` para aplicar los cambios con una `EXCLAMACIÓN` no se aplicara nada del begin y `AUTOMÁTICAMENTE` hara un `ROLLBACK` para deshacer todos los cambios.


### TRANSACTIONS STATEMENTS

| BEGIN |   SAVEPOINT   | ROLLBACK / ROLLBACK TO | COMMIT  
|--------|---------|----------| ---------- | 
| BEGIN;|  SAVEPOINT A; | ROLLBACK; / ROLLBACK TO A;| COMMIT;| 
 
- **BEGIN;**   Comenzar transacción `COMENZAR`
- **SAVEPOINT nombreguardado;**  Guardar punto con nombre de guardado `PUNTO GUARDADO`
- **ROLLBACK;** | **ROLLBACK to nombreguardado;** Volver a punto de guardado si no especificamos volvemos al principio del todo "antes del BEGIN" `DESHACER`
- **COMMIT;** Aplicar todos los cambios hechos dentro de la TRANSACCIÓN sin poder deshacer los cambios `FINALIZAR`

## EMPEZAMOS M10

**`SIEMPRE TENEMOS QUE ESTAR CONECTADOS A LA BASE DE DATOS QUE QUERAMOS MODIFICAR PARA HACER CAMBIOS !!!`**
```sql
SELECT current_user, session_user; SABER QUE USUARIO ESTAMOS

current_user = Que usuario estamos loggeados actualmente | session_user = Usuario con el que hemos entrado
--------------+--------------
 richi        | richi
```
CREATE USER jordi CREATEDB;\
CREATEDB = Es un conjunto de asignar 2 permisos LOGIN Y CREAR BD

### `DAR PRIVILEGIOS`

| Permiso | Acción                                      |
|---------|---------------------------------------------|
| **`a`**       | INSERT (añadir filas).                     |
| **`r`**       | SELECT (leer filas).                       |
| **`w`**       | UPDATE (modificar filas).                  |
| **`d`**       | DELETE (eliminar filas).                   |
| **`D`**       | TRUNCATE (eliminar todas las filas rápidamente). |
| **`x`**       | REFERENCES (usar claves foráneas que apunten a esta tabla). |
| **`t`**       | TRIGGER (crear y usar triggers en la tabla). |
| **`m`**       | SELECT ... FOR UPDATE (bloquear filas seleccionadas para actualizarlas después). |

---


 Al **`usuario (prueba)`** le asignamos permisos de añadir,lectura y modificación de filas.

```sql
 GRANT SELECT, INSERT, UPDATE ON zoo TO prueba;  
 SINTAXIS = GRANT privilegio1, privilegio2, privilegio3 ON tabla TO usuario;  

-- AÑADIR PRIVILEGIOS A TODOS LOS USUARIOS

 GRANT ALL PRIVILEGES ON emp TO pep;
 SINTAXIS = GRANT ALL PRIVILEGES ON tabla TO usuario/rol;
 ```
---



**`\dp`** tabla 

OUTPUT:

| Schema | Name    | Type  | Access privileges        | Column privileges | Policies |
|--------|--------|-------|--------------------------|-------------------|----------|
| public | animal | table |                          |                   |          |
| public | especie| table |                          |                   |          |
| public | zoo    | table | richi=arwdDxtm/richi+   |                   |          |
|        |        |       | prueba=`arw`/ `richi`          |                   |          |

**`arw`** | **`richi`** **PRIVILEGIOS ASIGNADOS | USUARIO QUE HA OTORGADO PRIVILEGIOS**

### `QUITAR PRIVILEGIOS`

```sql
REVOKE TRUNCATE ON zoo FROM prueba;
SINTAXIS = REVOKE privilegio ON tabla FROM usuario;

-- QUITAR TODOS LOS PRIVILEGIOS

REVOKE ALL PRIVILEGES ON emp FROM pep;

REVOKE ALL PRIVILEGES ON tabla FROM usuario/rol;
```

REVOKE TRUNCATE → Indica que se revoca el permiso de TRUNCATE.

ON zoo → Especifica la tabla sobre la cual se revoca el permiso.

FROM prueba → Especifica el usuario o rol al que se le quita el permiso.

---

### `ROLES`
| Opción              | Descripción                                                                 |
|---------------------|------------------------------------------------------------------------------|
| **`LOGIN / NOLOGIN`**       | Permite o no permite al rol iniciar sesión (conectarse).                    |
| **`CREATEDB / NOCREATEDB`** | Permite o no permite crear bases de datos.                                |
| **`PASSWORD `**        | Establece una contraseña para el rol.                                       |
|**` VALID UNTIL `**           | Define una fecha de caducidad para el rol.                                  |
|**` SUPERUSER / NOSUPERUSER `**| Atorga o revoca privilegios de superusuario.                          |
|**` INHERIT/NOINHERIT `**            | Controla si el rol hereda privilegios de otros roles.                       |
---


```sql
CREATE ROLE usuario
WITH
  LOGIN
  CREATEDB
  PASSWORD 'contraseña123'
  VALID UNTIL '2025-12-31'
  NOSUPERUSER
  INHERIT;
``` 
ROL = CONJUNTO DE PRIVILEGIOS
#### `CREAR ROL == USUARIO:`
```sql                      
CREATE ROLE anna WITH LOGIN PASSWORD 'contraseña';
SINTAXIS = CREATE ROLE nombre_rol opción1 opción 2;
```
#### `AÑADIR PRIVILEGIOS A ROL:`
```sql                      
ALTER ROLE anna CREATEDB; 
SINTAXIS = ALTER ROLE nombre_rol añadirprivilegio;
```

#### `QUITAR PRIVILEGIOS A ROL:`
```sql                      
REVOKE INSERT on zoo FROM anna; 
SINTAXIS = REVOKE privilegio on tabla FROM nombre_rol;
```

#### `ASIGNAR ROL A USUARIO:`

```sql
GRANT anna TO userprueba;

SINTAXIS = GRANT nombre_rol TO usuario;
```

#### `QUITAR ROL A USUARIO:`
```sql
REVOKE anna FROM user_prueba;

SINTAXIS = REVOKE nombre_rol FROM usuario;
```

#### `CAMBIAR ROL DESDE USUARIO:`

Esto se hace desde el usuario por ejemplo accedes como pep pero te pones en otro rol para tener acceso a otras cosas entonces desde dentro de ese rol.



```sql
SET ROLE anna;
SET ROLE nombrerol;
```

#### `Eliminar rol`


```sql
DROP ROLE anna;

SINTAXIS = DROP ROLE nombre_del_rol;

```
#### `VOLVER A USUARIO:`

En caso de que hayamos cambiado de rol para volver a nuestro rol de usuario principal hacemos el siguiente comando:

```sql
RESET ROLE;
```

### `ESQUEMAS`

Un esquema es una subdivisión dentro de una base de datos que agrupa tablas dentro de una base de datos.

Al crear los objetos por defecto se asignan al esquema `public` por defecto

```sql
CREATE SCHEMA richi;
SINTAXIS = CREATE SCHEMA nombre_schema;

--EN CASO DE CREAR UN ESQUEMA DESDE ADMIN PARA ASIGNAR UN PROPIETARIO:

CREATE SCHEMA nombre_schema AUTHORIZATION usuario;


CREATE table nombre_schema.emp (id int);
SINTAXIS = CREATE TABLE nombre_schema.nombre_tabla (campo1, campo2, campo3);

-- ESTAMOS CREANDO UNA TABLA CON EL MISMO NOMBRE QUE YA HAY EN SCOTT LO QUE HACE INTERNAMENTE ES ASIGNARLA AL ÚLTIMO ESQUEMA CREADO EN ESTE CASO "richi" entonces tenemos 2 tablas distintas public.emp que es la original la que contiene los valores y luego tenemos emp del esquema richi que no tiene nada de valores

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO maria;

SIEMPRE SERÁ

GRANT ALL PRIVILEGES ON objeto IN SCHEMA 
 
--DEPENDIENDO A QUE OBJETOS HAGAMOS EL ALL QUITAREMOS MÁS O MENOS PRIVILEGIOS CON EL \h comando podemos ver la sintaxis

Ej:

\h GRANT

SINTAXIS = GRANT TODOS LOS PRIVILEGIOS ON TABLA IN SCHEMA nombre_schema TO usuario;

El "public." es para identificar la tabla de un esquema diferente la cual hemos creado antes solo que no se muestrea en \dn ya que tienen el mismo nombre.

--Ver privilegios de esquemas

Si damos privilegios a public aparece como =r/propietarioa_de_la_tabla

\dp public.emp
SINTAXIS = \dp esquema.tabla

-- \dp emp NO ES LO MISMO EMP ASECAS AHORA PERTENECE AL ESQUEMA RICHI

```
## PROGRAMACIÓN SQL

CREATE OR REPLACE FUNCTION nombre_funcion parametros,

RETURNS { VARCHAR, INT/SMALLINT , DATE , TIMESTAMP , BOOLEAN , NUMERIC }

---

AS $$

DECLARE 
 --variables locals; 
BEGIN
 -- el codigo que usaremos

 END; \
 --$$LANGUAGE PLPGSQL;


```sql

CREATE OR REPLACE FUNCTION helloWorld ()
RETURNS VARCHAR
AS $$

BEGIN

    RETURN 'Hello World';


END;

$$LANGUAGE PLPGSQL;

--SI SALE BIEN SALDRÁ 'CREATE FUNCTION'

--PARA LLAMAR LA FUNCIÓN

SELECT helloWorld();
```

```sql

CREAR FUNCIÓN QUE SE LLAME mostraempleat la cual donat el codi del empleat hem retorni el seu nom


CREATE OR REPLACE FUNCTION mostraEmpleat(p_empno SMALLINT)
RETURNS VARCHAR
AS $$

DECLARE

    v_ename VARCHAR(100); --variable local

BEGIN

    SELECT ename
    INTO STRICT v_ename -- la variable de antes
    FROM emp
    WHERE empno = p_empno; -- parametro del codigo del empleado

    RETURN v_ename;

END;

$$LANGUAGE PLPGSQL;


--LLAMAR FUNCIÓN

 SELECT mostraEmpleat(7499::smallint); Especificamos el tipo de dato de la tabla si da un error como este 
 --HINT:  No function matches the given name and argument types. You might need to add explicit type casts.

```
### `GESTIONAR ERRORES:`

Si llamamos a la función con un valor que no existe nos dará el siguiente error

```sql
scott=> SELECT mostraEmpleat(1234::smallint);
ERROR:  query returned no rows
CONTEXT:  PL/pgSQL function mostraempleat(smallint) line 9 at SQL statement


CREATE OR REPLACE FUNCTION mostraEmpleat(p_empno SMALLINT)
RETURNS VARCHAR
AS $$

-- OTRA VARIABLE PORQUE QUEREMOS MOSTRAR EL JOB DEL EMPLEADO
DECLARE

    v_ename VARCHAR(100); --variable local
    v_job VARCHAR(100); 
-- También podemos poner v_job emp.job %type; asi no tenemos que consultar en consola

BEGIN

    SELECT ename  , job 
    INTO STRICT v_ename, v_job -- la variable de antes
    FROM emp
    WHERE empno = p_empno; -- parametro del codigo del empleado

    
    RETURN 'L''empleat ' || v_ename || ' treballa de ' || v_job ;

-- EL EXCEPTION PARA QUE CUANDO NO EXISTA EL VALOR MUESTRE UN MENSAJE

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN 'Error no n''hi ha cap valor que coincideixi amb la teva cerca : ' || p_empno;

END;

$$LANGUAGE PLPGSQL;


RESULTADO:

scott=> SELECT mostraEmpleat(7499::smallint);
            mostraempleat             
--------------------------------------
 L'empleat ALLEN treballa de SALESMAN
(1 row)
```
### `SELECCIONAR MUCHOS:`

```sql
CREATE OR REPLACE FUNCTION mostraEmpleat(p_empno SMALLINT)
RETURNS VARCHAR
AS $$

-- EL RECORD ES PARA GUARDAR X VALORES
DECLARE

   v_emp record; -- variable compuesta


BEGIN

    SELECT * 
    INTO STRICT v_emp -- la variable de antes
    FROM emp
    WHERE empno = p_empno; -- parametro del codigo del empleado

    
    RETURN  'L''empleat ' || v_emp.ename || ' treballa de ' || v_emp.job;

-- EL EXCEPTION PARA QUE CUANDO NO EXISTA EL VALOR MUESTRE UN MENSAJE

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN 'Error no n''hi ha cap valor que coincideixi amb la teva cerca : ' || p_empno;

END;

$$LANGUAGE PLPGSQL;
```
### `IF | THEN | ELSE | END IF:`

Mostrar nombre y salario y salario incrementat si es Salesman 10% mas si es clerk un 20% cualquier otro 30% y el job
```sql
CREATE OR REPLACE FUNCTION mostraEmpleat(p_empno SMALLINT)
RETURNS VARCHAR
AS $$

-- EL RECORD ES PARA GUARDAR X VALORES
DECLARE

   v_emp record; -- variable compuesta
   v_emp sale

BEGIN

    SELECT * 
    INTO STRICT v_emp -- la variable de antes
    FROM emp
    WHERE empno = p_empno; -- parametro del codigo del empleado
    
    IF LOWER(v_emp.job)= 'salesman' THEN v_sal := v_emp.sal * 1.1;
    ELSE 
    
    RETURN  'L''empleat ' || v_emp.ename || ' treballa de ' || v_emp.job;

-- EL EXCEPTION PARA QUE CUANDO NO EXISTA EL VALOR MUESTRE UN MENSAJE

EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    RETURN 'Error no n''hi ha cap valor que coincideixi amb la teva cerca : ' || p_empno;

END;

$$LANGUAGE PLPGSQL;
```










## Funciones Útiles en SQL

### `ctrl+r`

Hacer búsqueda de comandos recientes también para LINUX

### `COALESCE` Convierte valores `NULL` en un valor operable o texto
---
**SUSTITUIR POR VALOR OPERABLE** 
```sql
SELECT ename, sal, COALESCE(comm, 0) "Comision"
FROM emp;
```
`COALESCE(comm, 0)` → Si una o varias filas `comm` es/són `NULL`, se reemplazaran por `0` \
 Se usa para poder operarlo, ya que los valores `NULL`són inoperables y suelen dar error en funciones complejas.


`OUTPUT`
| ename  |   sal   | Comision |
|--------|---------|----------|
| SMITH  |  800.00 |        0 |
| ALLEN  | 1600.00 |   300.00 |
| WARD   | 1250.00 |   500.00 |
| JONES  | 2975.00 |        0 |

---

**SUSTITUIR POR TEXTO** 
```sql
SELECT ename, sal, COALESCE(comm::TEXT, 'No tiene comisión') AS "Comision"
FROM emp;

```
`COALESCE(comm, 0)` → Si `comm` es `NULL`, se reemplaza por `No tiene comisión`. 

`OUTPUT`

| ename  |   sal   | Comision           |
|--------|---------|--------------------|
| SMITH  |  800.00 | No tiene comisión  |
| ALLEN  | 1600.00 | 300.00             |
| WARD   | 1250.00 | 500.00             |
| JONES  | 2975.00 | No tiene comisión esto y esto |


---

### `Concatenación`
Une múltiples valores en una sola cadena.

```sql
SELECT salario || '€' "Avg Product Price"
FROM emp;
```

- `||` → Operador de concatenación en SQL.

---

### `::TEXT`
Convierte un dato en tipo texto.

```sql
SELECT ename, sal::TEXT AS SalarioTexto
FROM emp;
```

- `sal::TEXT` → Convierte el número `sal` en texto.

---

### `ALIAS PARA TABLAS`
Asigna un nombre a un campo o tabla para hacerlo \
más bonito y simple visulmente para el usuario final.

```sql
SELECT ename "alias ename" , job "aliasjob"
FROM emp;
```

`RESULTADO:`

| alias ename | alias job                          |
|-----------|--------------------------------------|
| SMITH       | CLERK                       |
| ALLEN       | SALESMAN                          |
| WARD     | SALESMAN                           |
| JONES      | MANAGER                           |
|  MARTIN   | MANAGER                       |
| BLAKE      | MANAGER                       |




# APUNTES BBDD

## Operadores


| Operador  | Descripción                          |
|-----------|--------------------------------------|
| `=`       | Igual                               |
| `!=`      | Diferente                           |
| `>`       | Mayor que                           |
| `<`       | Menor que                           |
| `>=`      | Mayor o igual                       |
| `<=`      | Menor o igual                       |
| `BETWEEN` | Para valores dentro de un rango     |
| `LIKE`    | Para búsqueda de patrones          |
| `IN`      | Para comparar con una lista de valores |
| `IS NULL` / `IS NOT NULL` | Para comprobar valores nulos |

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
| `\dt`              | Muestra solo las tablas. |
| `\d nombre_tabla`  | Muestra la estructura de `nombre_tabla`, incluyendo triggers. |
| `\dv`              | Muestra las vistas existentes. |
| `\d nombre_vista`  | Muestra la estructura de `nombre_vista`, incluyendo triggers. |
| `\x`              | Cambiar display por si se ve mal. |
| `\ds`              | Muestra las secuencias. |
| `\dn`              | Muestra los esquemas. |
| `\di`              | Muestra los índices de PostgreSQL. |

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

## Restricciones y Cascadas

### `Por defecto` 

### `ON DELETE SET NULL`

Cuando se elimina un registro en `tabla_1`, los registros relacionados en `tabla_intermedia` tendrán su clave foránea puesta en `NULL`.

```sql
DELETE FROM tabla_1 WHERE campo_1='Ejemplo 1';
```

### `ON DELETE CASCADE`

Cuando se elimina un registro en `tabla_3`, los registros dependientes en `tabla_relacion` también se eliminan automáticamente.

```sql
DELETE FROM tabla_3 WHERE id='2';
```

### `ON UPDATE CASCADE`

Cuando se actualiza la clave primaria de un registro en `tabla_2`, las claves foráneas en `tabla_intermedia` se actualizan automáticamente.

```sql
UPDATE tabla_2 SET id= 3 WHERE id=2;
```

## Funciones de Agrupación
| Función  | Descripción                          |
|-----------|--------------------------------------|
| `COUNT(*)`       | Contamos num de registros     |
| `AVG(campo)`      | Hacemo la media             |
| `MAX(campo)`       | Muestra valor máximo de ese campo |
| `MIN(campo)`      | Muestra valor mínimo de ese campo |
| **Ejemplos** 
| `COUNT`      | SELECT COUNT(DISTINCT mgr) "Numero jefe" FROM emp; |
| `AVG`           | SELECT MAX(sal) FROM emp;|
| `MAX`              | SELECT MAX(sal) FROM emp;|
| `MIN`         | SELECT MIN(sal) FROM emp;|


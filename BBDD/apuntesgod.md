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
SELECT emp.ename, emp.job, dept.dname 
FROM emp
INNER JOIN dept ON emp.deptno = dept.deptno;
```

### Ejemplo Explicado:
---
Suponiendo que tenemos una tabla `emp` con empleados y una tabla `dept` con departamentos,
este INNER JOIN traerá solo los empleados que tienen un departamento asignado en ambas tablas.

"No hace falta específicar inner"

## `LEFT JOIN (LEFT OUTER JOIN)`
---
Devuelve todas las filas de la tabla de la izquierda y las coincidentes de la tabla de la derecha.
Si no hay coincidencia, devuelve NULL en las columnas de la tabla derecha.

```sql
SELECT emp.ename, emp.job, dept.dname 
FROM emp
LEFT JOIN dept ON emp.deptno = dept.deptno;
```

### Ejemplo Explicado:
---
LEFT = `emp`
```sql
-- Muestra todos los empleados, incluso si no tienen un departamento asignado o sea valor 'NULL`
```

## `RIGHT JOIN (RIGHT OUTER JOIN)`
Devuelve todas las filas de la tabla de la derecha y las coincidentes de la tabla de la izquierda.
Si no hay coincidencia, devuelve NULL en las columnas de la tabla izquierda.

```sql
SELECT emp.ename, emp.job, dept.dname 
FROM emp
RIGHT JOIN dept ON emp.deptno = dept.deptno;
```

### Ejemplo Explicado:
RIGHT = `emp`
```sql
-- Muestra todos los departamentos, incluso si no tienen empleados asignados o sea valor 'NULL`
```

## `FULL JOIN (FULL OUTER JOIN)`
Devuelve todas las filas cuando hay coincidencia en cualquiera de las tablas.
Si no hay coincidencia en una tabla, se devuelve NULL en su lugar.

```sql
SELECT emp.ename, emp.job, dept.dname 
FROM emp
FULL JOIN dept ON emp.deptno = dept.deptno;
```

### Ejemplo Explicado:
```sql
-- Muestra todos los empleados y todos los departamentos.
-- Si un empleado no tiene departamento, `dname` será NULL.
-- Si un departamento no tiene empleados, `ename` será NULL.
```

## `CROSS JOIN`
Devuelve el producto cartesiano de ambas tablas (cada fila de la primera se combina con cada fila de la segunda).

```sql
SELECT emp.ename, dept.dname 
FROM emp
CROSS JOIN dept;
```

### Ejemplo Explicado:
```sql
-- Si hay 10 empleados y 4 departamentos, el resultado tendrá 10 × 4 = 40 filas.
```
## `SELF JOIN`
Un SELF JOIN es un JOIN de una tabla consigo misma.

```sql
SELECT e1.ename AS Empleado, e2.ename AS Jefe 
FROM emp e1
JOIN emp e2 ON e1.mgr = e2.empno;
```

### Ejemplo Explicado:
```sql
-- Une la tabla `emp` consigo misma para encontrar quién es el jefe de cada empleado.
```
---


## Funciones Útiles en SQL

### `COALESCE`

Convierte valores `NULL` en un valor especificado para poder operarlo.

```sql
SELECT ename, sal, COALESCE(comm, 0) 'Comision'
FROM emp;
```

- `COALESCE(comm, 0)` → Si `comm` es `NULL`, se reemplaza por `0`.

```sql
SELECT ename, sal, COALESCE(o.ciudad::TEXT,  'sin oficina'  ) 'Oficina'
FROM emp;
```

- También podemos poner texto en caso de `o.ciudad` es `NULL`, se reemplaza por `sin oficina`.

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
Asigna un alias a una columna o tabla.

```sql
SELECT ename 'alias' NombreEmpleado, job 'alias'
FROM emp;
```

- `AS` → Renombra las columnas en el resultado.

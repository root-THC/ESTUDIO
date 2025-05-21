# Funcions de transaccions (MONOUSUARI)

Creeu una base de dades anomenada __transaccions__, amb una única taula anomenada __punts__, amb la següent estructura: id de tipus INT (CP) i valor de tipus SMALLINT.

1. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT.  

```
INSERT INTO punts (id, valor) VALUES (10,5);
BEGIN;
UPDATE punts SET valor = 4 WHERE id = 10;
ROLLBACK;
SELECT valor FROM punts WHERE id = 10;
```
-- Mostrará 5 ya que al hacer rollback no se ejecuta nada a partir del begin
-- solo el insert del principio.

2. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT.  

```
INSERT INTO punts (id, valor) VALUES (20,5);
BEGIN;
UPDATE punts SET valor = 4 WHERE id = 20;
COMMIT;
SELECT valor FROM punts WHERE id = 20;
```
--Valor será 4 porque con el commit guardamos los cambios que incluyen un update 

3. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT.
```
INSERT INTO punts (id, valor) VALUES (30,5);
BEGIN;
UPDATE punts SET valor = 4 WHERE id = 30;
SAVEPOINT a;
INSERT INTO punts (id, valor) VALUES (31,7);
ROLLBACK;
SELECT valor FROM punts WHERE id = 30;
```
-- Como el rollback no especificamos el punto de guardado 
-- vuelve al principio o sea que valor 5

4. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT.

```
DELETE FROM punts;
INSERT INTO punts (id, valor) VALUES (40,5);
BEGIN;
UPDATE punts SET valor = 4 WHERE id = 40;
SAVEPOINT a;
INSERT INTO punts (id, valor) VALUES (41,7);
ROLLBACK TO a;
SELECT COUNT(*) FROM punts;
```
-- La transacción no ha acabado y como no lo hemos guardado con ningún commmit 
-- mostrará un SELECT del estado actual dentro de la transacción por lo tanto 
-- 1 fila porque es un count cuyos valores són (40,4)

5. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT.

```
INSERT INTO punts (id, valor) VALUES (50,5);
BEGIN;
SELECT id, valor WHERE punts;
UPDATE punts SET valor = 4 WHERE id = 50;
COMMIT;
SELECT valor FROM punts WHERE id = 50;
```

-- Mostraria 5 ya que el select esta mal hecho falta el from y por tanto daria error
-- al no haber ninguín savepoint volveria al estado de antes de la transacción

6. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT.

```
DELETE FROM punts;
INSERT INTO punts (id, valor) VALUES (60,5);
BEGIN;
UPDATE punts SET valor = 4 WHERE id = 60;
SAVEPOINT a;
INSERT INTO punts (id, valor) VALUES (61,8);
SAVEPOINT b;
INSERT INTO punts (id, valor) VALUES (61,9);
ROLLBACK TO b;
COMMIT;
SELECT SUM(valor) FROM punts;
```

-- Mostaria 12 la suma de VALOR = 8 CON ID 61 Y VALOR = 4 ID 60

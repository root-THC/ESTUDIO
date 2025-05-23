# Transacciones (Multiusuari)

7. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT. Tenint en compte que cada sentència s'executa en una connexió determinada.

```
DELETE FROM punts; -- Connexió 0
INSERT INTO punts (id, valor) VALUES (70,5); -- Connexió 0

BEGIN; -- Connexió 1
DELETE FROM punts; -- Connexió 1

SELECT COUNT(*) FROM punts; -- Connexió 2
```
Como el SELECT es temporal mostrara 1 fila solo porque no se ha 
echo commit.



8. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT. Tenint en compte que cada sentència s'executa en una connexió determinada.

```
INSERT INTO punts (id, valor) VALUES (80,5); -- Connexió 0
INSERT INTO punts (id, valor) VALUES (81,9); -- Connexió 0

BEGIN; -- Connexió 1
UPDATE punts SET valor = 4 WHERE id = 80; -- Connexió 1

BEGIN; -- Connexió 2
UPDATE punts SET valor = 8 WHERE id = 81; -- Connexió 2

UPDATE punts SET valor = 10 WHERE id = 81; -- Connexió 1

UPDATE punts SET valor = 6 WHERE id = 80; -- Connexió 2
COMMIT; -- Connexió 2

COMMIT; -- Connexió 1

SELECT valor FROM punts WHERE id = 80; -- Connexió 0
```
| Usuari | Blocat/Desblocat | Motiu                                                             |
|--------|------------------|--------------------------------------------------------------------|
| 1      | B                | Ús de dades de l'usuari 2                                         |
| 2      | B                | Ús de dades de l'usuari 1                                         |
|        | Deadlock         | L'usuari 2 provoca *deadlock* i es desfan les operacions dins la transacció |


Por lo tanto muestra el 4 que es el update que se hace en la conexión 1 

9. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT. Tenint en compte que cada sentència s'executa en una connexió determinada.

```
INSERT INTO punts (id, valor) VALUES (90,5); -- Connexió 0

BEGIN; -- Connexió 1
DELETE FROM punts; -- Connexió 1

BEGIN; -- Connexió 2
INSERT INTO punts (id, valor) VALUES (91,9); -- Connexió 2
COMMIT; -- Connexió 2

COMMIT; -- Connexió 1

SELECT valor FROM punts WHERE id = 91; -- Connexió 0
```
| Usuari | Blocat/Desblocat | Motiu                                                             |
|--------|------------------|--------------------------------------------------------------------|
| 1      | B                | Ús de dades de l'usuari 2                                         |
| 2      | B                | Ús de dades de l'usuari 1                                         |
|        | Deadlock         | L'usuari 2 provoca *deadlock* i es desfan les operacions dins la transacció |

10. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT. Tenint en compte que cada sentència s'executa en una connexió determinada.

```
INSERT INTO punts (id, valor) VALUES (100,5); -- Connexió 0

BEGIN; -- Connexió 1
UPDATE punts SET valor = 6 WHERE id = 100; -- Connexió 1

BEGIN; -- Connexió 2
UPDATE punts SET valor = 7 WHERE id = 100; -- Connexió 2
COMMIT; -- Connexió 2

COMMIT; -- Connexió 1

SELECT valor FROM punts WHERE id = 100; -- Connexió 0
```

| Usuari | Blocat/Desblocat | Motiu                                                             |
|--------|------------------|--------------------------------------------------------------------|
| 2      | B                | Ús de dades de l'usuari 1                                         |
| 2      | D           | Desbloquejat perque la transacció de l'usuari 1 ha finalitzar                                         |


Muestra valor 7 porque se hace el update de la conexión 2 una vez finalizada la 1era

11. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT. Tenint en compte que cada sentència s'executa en una connexió determinada.

```
INSERT INTO punts (id, valor) VALUES (110,5); -- Connexió 0
INSERT INTO punts (id, valor) VALUES (111,5); -- Connexió 0

BEGIN; -- Connexió 1
UPDATE punts SET valor = 6 WHERE id = 110; -- Connexió 1

BEGIN; -- Connexió 2
UPDATE punts SET valor = 7 WHERE id = 110; -- Connexió 2
UPDATE punts SET valor = 7 WHERE id = 111; -- Connexió 2
SAVEPOINT a; -- Connexió 2
UPDATE punts SET valor = 8 WHERE id = 110; -- Connexió 2
ROLLBACK TO a; -- Connexió 2
COMMIT; -- Connexió 2

COMMIT; -- Connexió 1

SELECT valor FROM punts WHERE id = 111; -- Connexió 0
```
| Usuari | Blocat/Desblocat | Motiu                                                             |
|--------|------------------|--------------------------------------------------------------------|
| 2      | B                | Se queda bloqueado por el commit de la conexión 2                                  |
| 2      | D                | Se desbloquea porque finaliza la transacción del usuario1                                         |

111 mostrara valor 7 debido a los updates que se hacen antes del savepoint A de la conexión 2 .



12. Analitzant les següents sentències explica quins canvis es realitzen i on es realitzen. Finalment digues quin valor s'obtindrà amb l'últim SELECT. Tenint en compte que cada sentència s'executa en una connexió determinada.

```
INSERT INTO punts (id, valor) VALUES (120,5); -- Connexió 0
INSERT INTO punts (id, valor) VALUES (121,5); -- Connexió 0

BEGIN; -- Connexió 1
--UPDATE punts SET valor = 6 WHERE id = 121; -- Connexió 1
SAVEPOINT a;
UPDATE punts SET valor = 9 WHERE id = 120; -- Connexió 1

BEGIN; -- Connexió 2
--UPDATE punts SET valor = 7 WHERE id = 120; -- Connexió 2

ROLLBACK TO a; -- Connexió 1

SAVEPOINT a; -- Connexió 2
UPDATE punts SET valor = 8 WHERE id = 120; -- Connexió 2
ROLLBACK TO a; -- Connexió 2
COMMIT; -- Connexió 2

COMMIT; -- Connexió 1

SELECT valor FROM punts WHERE id = 121; -- Connexió 0
```

| Usuari | Blocat/Desblocat | Motiu                                                             |
|--------|------------------|--------------------------------------------------------------------|
| 2      | B                | Se queda bloqueado por el commit de la conexión 2                                           |
| 2      | D                | Se desbloquea por el commit del 1                                         |

EL valor que mostrara 121 6
/*
script name: tablasScott.sql
     author: Jordi Andúgar
       date: 20/01/2022
    version: 1.0
       DBMS: PostgreSQL server
description: operations updating and deleting restricted by default
*/

\c template1
DROP DATABASE IF EXISTS scott;
CREATE DATABASE scott;
\c scott

CREATE SEQUENCE deptno_seq
  START WITH 50
  INCREMENT BY 10;

/* Creo la seqüència empno_seq amb valor d'inici 1 i increment de un en un */
CREATE SEQUENCE empno_seq;

CREATE TABLE dept (
deptNo SMALLINT  CONSTRAINT dept_pk PRIMARY KEY,
 dName VARCHAR(50),
   loc VARCHAR(50),
CONSTRAINT emp_uk UNIQUE(dname)
);

INSERT INTO dept VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO dept VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO dept VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMP (
   empNo SMALLINT CONSTRAINT emp_pk PRIMARY KEY,
   ename VARCHAR(100),
     job VARCHAR(100),
     mgr SMALLINT,
hiredate DATE,
     sal NUMERIC(7, 2),
    comm NUMERIC(7, 2),
  deptNO SMALLINT
);

CREATE OR REPLACE VIEW empleat AS
  	SELECT ename NomEmp, sal salari,job ofici, dname Nomdept, Loc Localitat
  	  FROM emp, dept
  	 WHERE emp.deptno = dept.deptno;

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902, TO_DATE('17-10-1980', 'DD-MM-YYYY'),  800, NULL, 20),
        (7499, 'ALLEN',  'SALESMAN',  7698, TO_DATE('20-02-1981', 'DD-MM-YYYY'), 1600,  300, 30),
        (7521, 'WARD',   'SALESMAN',  7698, TO_DATE('22-02-1981', 'DD-MM-YYYY'), 1250,  500, 30),
        (7566, 'JONES',  'MANAGER',   7839, TO_DATE('2-04-1981', 'DD-MM-YYYY'),  2975, NULL, 20),
        (7654, 'MARTIN', 'SALESMAN',  7698, TO_DATE('28-09-1981', 'DD-MM-YYYY'), 1250, 1400, 30),
        (7698, 'BLAKE',  'MANAGER',   7839, TO_DATE('1-05-1981', 'DD-MM-YYYY'),  2850, NULL, 30),
        (7782, 'CLARK',  'MANAGER',   7839, TO_DATE('9-06-1981', 'DD-MM-YYYY'),  2450, NULL, 10),
        (7788, 'SCOTT',  'ANALYST',   7566, TO_DATE('09-12-1982', 'DD-MM-YYYY'), 3000, NULL, 20),
        (7839, 'KING',   'PRESIDENT', NULL, TO_DATE('17-11-1981', 'DD-MM-YYYY'), 5000, NULL, 10),
        (7844, 'TURNER', 'SALESMAN',  7698, TO_DATE('8-09-1981', 'DD-MM-YYYY'),  1500,    0, 30),
        (7876, 'ADAMS',  'CLERK',     7788, TO_DATE('12-01-1983', 'DD-MM-YYYY'), 1100, NULL, 20),
        (7900, 'JAMES',  'CLERK',     7698, TO_DATE('3-12-1981', 'DD-MM-YYYY'),   950, NULL, 30),
        (7902, 'FORD',   'ANALYST',   7566, TO_DATE('3-12-1981', 'DD-MM-YYYY'),  3000, NULL, 20),
        (7934, 'MILLER', 'CLERK',     7782, TO_DATE('23-01-1982', 'DD-MM-YYYY'), 1300, NULL, 10);

  /* A la seqüència empno_seq li dono de valor d'inici el valor més gran que hi ha al camp empno
     El paràmetre TRUE vol dir que el valor que es generarà serà el següent al màxim
     L'increment per defecte és 1
  */

SELECT SETVAL('empno_seq', (SELECT MAX(empno) FROM emp), TRUE);

CREATE TABLE salgrade (
  grade SMALLINT,
  losal NUMERIC,
  hisal NUMERIC);

INSERT INTO salgrade VALUES
 (1,  700, 1200),
 (2, 1201, 1400),
 (3, 1401, 2000),
 (4, 2001, 3000),
 (5, 3001, 9999);

ALTER TABLE  emp ADD CONSTRAINT emp_deptno_fk FOREIGN KEY (deptno) REFERENCES dept ON UPDATE CASCADE;
ALTER TABLE  emp ADD CONSTRAINT emp_mgr_fk FOREIGN KEY (mgr) REFERENCES emp;

--JOINS

INSERT INTO emp (empNo,ename,job) VALUES (7777,'Ricardo','Director')

-- OUTER JOIN es para los que no cumplen la condición de la aliena en caso de que pueda haber nulos sera OUTER join que es el LEFT RIGHT O FULL "Es muy raro usarlo"
-- El left o right o full hace referencia el campo hay que indicar el campo que tenga la clave aliena vacía en este caso es emp ya que hemos agregado un empleado 
/*
SELECT ename,job, d.dname
FROM emp LEFT
JOIN dept d ON emp.deptno=d.deptno;


--El full es para que se fije en los 2 campos que no cumplen 
SELECT ename,job, d.dname
FROM emp FULL
JOIN dept d ON emp.deptno=d.deptno;

--SELF JOIN
SELECT emp.ename Empl , jefe.ename Jefe
FROM emp JOIN emp jefe
ON emp.mgr=jefe.empno;


SELECT ename , sal , s.grade
FROM emp WHERE sal>=losal AND sal<=hisal;









--INSERT INTO emp VALUES (NEXTVAL('empno_seq') ,'PEPITA' ,NULL ,7566 ,TO_DATE('15/12/2023' ,'DD-MM-YYYY') ,2000 ,NULL ,40);
--UPDATE emp SET ename = 'PEREZ' WHERE LOWER(ename) = 'smith' AND deptno=20; --LOWER o UPPER o (INITCAP primera en mayúscula) para asegurar 
--que todo el texto del campo sea igual y el texto entre comillas tiene si fuera UPPER(ename) = 'SMITH'  
--DELETE FROM emp WHERE job= 'CLERK';
--UPDATE emp SET sal = sal + sal*0.1 WHERE job = 'SALESMAN';



--MOSTRAR NOM SALARI COMM SUMA SAL+COMM

--SELECT ename FROM emp WHERE LOWER(ename) LIKE '_l%'; -- MOSTRAR LOS QUE DE SEGUNDO CARACTER TENGAN LA L _ = CARACTER %=CARACTERES ...


--SELECT ename,sal, COALESCE(comm::TEXT,'-')  

--SELECT ename,sal, COALESCE(comm::TEXT,'-') comm,  -- el comm despues de los parentesis es la etiqueta que quiero que aparezca
--sal+COALESCE(comm,0) 
--"sal+comm"
--FROM emp;
 -- MOSTRAR NOMBRE SALARIO Y COMISION COALESCE para que los valores NULL sean = 0 


--Mostrar el nombre y numero de dias que lleva contratado un empleado.

--SELECT *, (CURRENT_DATE - hiredate)/365.0 AS "años contratado" FROM emp; 
--timestamp

--SELECT CURRENT_DATE - interval '1 hours 30 minutes';
--SELECT CURRENT_TIMESTAMP - interval '1 hours 30 minutes';


--SELECT ename, dname , emp.deptno
--FROM emp JOIN dept ON emp.deptno = dept.deptno;

-- JOIN UTILIZA EL INNER QUE ES PARA LOS VALORES QUE TIENEN UN VALOR ASIGNADO
--TAMBIÑEN ESTA EL OUTER QUE SIRVE PARA LOS QUE TIENEN VALORES NULOS
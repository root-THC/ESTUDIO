
--1 La secuencia ya esta creada más arriba 
INSERT INTO dept VALUES (NEXTVAL('deptno_seq'), 'CONSULTORY', 'SANTANDER');

--2 He tenido que añadir un empleado que haga de manager

INSERT INTO emp  (empno,ename,job) VALUES (8200, 'MANAGER',  'MANAGER');
INSERT INTO emp (empno,ename,job,mgr,deptno) VALUES (NEXTVAL('empno_seq'),'Andreu','ANALYST',8200,30);

--3 
UPDATE emp SET hiredate = CURRENT_DATE WHERE LOWER(ename) = 'scott';

--4 
UPDATE emp SET job = 'ANALYST' , mgr = 7566 , sal = sal + sal*0.2 , deptno = 30 WHERE LOWER(ename) = 'miller';

--5 
UPDATE emp SET sal = sal + sal*0.06 ;

--6 
-- 
ALTER TABLE emp ADD COLUMN status VARCHAR(20) CHECK (status IN ('ACTIVE', 'ON_LEAVE', 'INACTIVE', 'TERMINATED'));
-- 
UPDATE emp SET status = 'ACTIVE';
-- 
UPDATE emp SET status = 'ON_LEAVE' WHERE LOWER(ename) = 'james'; 

--7 
INSERT INTO emp (empno,ename,sal,deptno) VALUES (1657,'SANZ',3000,30);

--8 
UPDATE emp SET deptno = 40 WHERE LOWER(ename) = 'sanz';

--9 
UPDATE emp SET job = 'SALESMAN' , comm = 4000 WHERE LOWER(ename) = 'sanz';

--10 
UPDATE emp SET comm = comm + sal*0.2; -- hola comm los campos que són nulos siempre seran nulos si lo calculas

--11
 UPDATE emp SET sal = sal + sal*0.35 WHERE sal < (SELECT sal FROM emp WHERE LOWER(ename)='sanz');

--12
--
UPDATE emp SET status = 'TERMINATED' WHERE LOWER(ename) = 'sanz';
--DELETE FROM emp WHERE LOWER(ename) = 'sanz';

--13
--
DELETE FROM emp WHERE deptno = 30;

--14

UPDATE emp SET mgr = NULL WHERE mgr = 7839;
DELETE FROM emp WHERE deptno = (SELECT deptno FROM dept WHERE dName = 'ACCOUNTING');


SELECT * FROM emp;

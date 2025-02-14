
--APUNTES SQL

-- Lineas de comando sql 

\d tabla para ver 

--SELECTS :
SELECT UPPER (‘hOlA’);
resultado todo en mayúscula

SELECT LOWER (‘hOlA’);
resultado todo en minúscula


--Fecha
TO_DATE(‘12/07/24’,’dd/mm/yy’)

--SECUENCIA

CREATE SEQUENCE nombre_secuencia
START WITH 10 INCREMENT BY 20;

SELECT NEXTVAL ('nombre_secuencia')


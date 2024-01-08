ANTES DE EJECUTAR NADA HACER ESTO:
SET SERVEROUTPUT ON;

-----------------------------------------
Enunciado1:

BEGIN 
  dbms_output.put_line (TO_CHAR (SYSDATE,'yyyy-mm-dd hh24:mi:ss')); 
END; 

-----------------------------------------

Enunciado2:

create or replace procedure proc2(para1 varchar2, para2 varchar2)
 IS
 salida VARCHAR(40);
 begin
    salida := to_char(para1 || '-' || para2);
    DBMS_OUTPUT.PUT_LINE(salida);
 end;

BEGIN
    proc2('hola','tractor');
END;

-----------------------------------------

Enunciado3:

CREATE OR REPLACE FUNCTION hola(entrada1 IN VARCHAR2)
RETURN NUMBER
IS 
total_char NUMBER DEFAULT 0;
BEGIN 
    SELECT LENGTH(entrada1)
    INTO total_char
    FROM DUAL;
    RETURN total_char;
END hola;
/

SELECT hola('12345')
FROM DUAL;

-----------------------------------------

Enunciado4:

SELECT line, text, type 
FROM user_source 
where UPPER(name) like 'PROC2';

SELECT line, text, type 
FROM user_source 
where UPPER(name) like 'HOLA'; 


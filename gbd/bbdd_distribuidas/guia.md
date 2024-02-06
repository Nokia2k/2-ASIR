# Administración de Sistemas de Gestión de Bases de Datos
*Victor Martinez Martinez*

Bases de datos distribuidas y replicadas

![imagen](./img/titulo.png)

---

## Paso 1
Creamos lo primero los tablespaces de cada uno de los institutos y de las particiones

El tablespace de Adrian:
```bash
CREATE TABLESPACE ts_ausias
DATAFILE 'C:\app\viktor\product\21c\ausias.dbf' SIZE 100M 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO; 
```

El tablespace de David:
```bash
CREATE TABLESPACE ts_jaume 
DATAFILE 'C:\app\viktor\product\21c\jaume.dbf' SIZE 100M 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO; 
```

El tablespace de Jose:
```bash
CREATE TABLESPACE ts_enric
DATAFILE 'C:\app\viktor\product\21c\enric.dbf' SIZE 100M 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO; 
```

El tablespace de Viktor:
```bash
CREATE TABLESPACE ts_lluis
DATAFILE 'C:\app\viktor\product\21c\lluis.dbf' SIZE 100M 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO; 
```

El tablespace de la particion 1:
```bash
CREATE TABLESPACE ts_particion1
DATAFILE 'C:\app\viktor\product\21c\particion1.dbf' SIZE 100M 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO; 
```

El tablespace de la particion 2:
```bash
CREATE TABLESPACE ts_particion2
DATAFILE 'C:\app\viktor\product\21c\particion2.dbf' SIZE 100M 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO; 
```

El tablespace de la particion 3:
```bash
CREATE TABLESPACE ts_particion3
DATAFILE 'C:\app\viktor\product\21c\particion3.dbf' SIZE 100M 
EXTENT MANAGEMENT LOCAL 
SEGMENT SPACE MANAGEMENT AUTO; 
```
---

## Paso 2
Ahora crearemos todos los usuarios con sus respectibas tablespaces

El usuario de Adrian:
```bash
CREATE USER adrian IDENTIFIED BY 12345 
DEFAULT TABLESPACE ts_ausias
TEMPORARY TABLESPACE TEMP 
QUOTA 70M ON ts_ausias; 
```

El usuario de David:
```bash
CREATE USER david IDENTIFIED BY 12345 
DEFAULT TABLESPACE ts_jaume
TEMPORARY TABLESPACE TEMP 
QUOTA 70M ON ts_jaume; 
```

El usuario de Jose:
```bash
CREATE USER jose IDENTIFIED BY 12345 
DEFAULT TABLESPACE ts_enric
TEMPORARY TABLESPACE TEMP 
QUOTA 70M ON ts_enric; 
```

El usuario de Viktor:
```bash
CREATE USER viktor IDENTIFIED BY 12345 
DEFAULT TABLESPACE ts_lluis
TEMPORARY TABLESPACE TEMP 
QUOTA 70M ON ts_lluis; 
```

## Paso 3
Ahora toca crear las tablas:

La tabla alumnos:
```bash
CREATE TABLE ALUMNOS ( 
    NIA NUMBER(8) PRIMARY KEY, 
    dni VARCHAR2(9) , 
    nombre VARCHAR2(20),  
    ciudad VARCHAR2(15) DEFAULT 'Valencia',  
    telefono NUMBER(9),  
    ciclo VARCHAR2(10),  
    nota NUMBER(2,1) 
)  

PARTITION BY RANGE (NIA) (  
    PARTITION particion_1 VALUES LESS THAN (20000000) TABLESPACE TS_PARTICION1, 
    PARTITION particion_2 VALUES LESS THAN (40000000) TABLESPACE TS_PARTICION2,  
    PARTITION particion_3 VALUES LESS THAN (MAXVALUE) TABLESPACE TS_PARTICION3 
);  
```
La tabla alumnos_adrian:
```bash
CREATE TABLE ALUMNOS_adrian ( 

    NIA NUMBER(8) PRIMARY KEY, 
    dni VARCHAR2(9) , 
    nombre VARCHAR2(20),  
    ciudad VARCHAR2(15) DEFAULT 'Valencia',  
    telefono NUMBER(9),  
    ciclo VARCHAR2(10),  
    nota NUMBER(2,1) 
    
)  TABLESPACE TS_AUSIAS;
```
La tabla alumnos_david:
```bash
CREATE TABLE ALUMNOS_david ( 

    NIA NUMBER(8) PRIMARY KEY, 
    dni VARCHAR2(9) , 
    nombre VARCHAR2(20),  
    ciudad VARCHAR2(15) DEFAULT 'Valencia',  
    telefono NUMBER(9),  
    ciclo VARCHAR2(10),  
    nota NUMBER(2,1) 
    
)  TABLESPACE TS_JAUME;
```
La tabla alumnos_jose:
```bash
CREATE TABLE ALUMNOS_jose ( 

    NIA NUMBER(8) PRIMARY KEY, 
    dni VARCHAR2(9) , 
    nombre VARCHAR2(20),  
    ciudad VARCHAR2(15) DEFAULT 'Valencia',  
    telefono NUMBER(9),  
    ciclo VARCHAR2(10),  
    nota NUMBER(2,1) 
    
)  TABLESPACE TS_ENRIC;
```


## Paso 4
A continuacion toca dar los permisos necesarios a todos los usuarios

Los permisos de Adrian:
```bash
GRANT CREATE SESSION TO adrian; 
GRANT CONNECT TO adrian; 
GRANT SELECT, DELETE, UPDATE, INSERT ON alumnos_adrian TO adrian;   
```

Los permisos de David:
```bash
GRANT CREATE SESSION TO david; 
GRANT CONNECT TO david; 
GRANT SELECT, DELETE, UPDATE, INSERT ON alumnos_david TO david; 
```
Los permisos de Jose:
```bash
GRANT CREATE SESSION TO jose; 
GRANT CONNECT TO jose; 
GRANT SELECT, DELETE, UPDATE, INSERT ON alumnos_jose TO jose; 
```
Los permisos de Viktor:
```bash
GRANT CREATE SESSION TO viktor; 
GRANT CONNECT TO viktor; 
GRANT CREATE ANY TABLE TO viktor;
GRANT SELECT ANY TABLE TO viktor; 
GRANT DELETE ANY TABLE TO viktor; 
GRANT UPDATE ANY TABLE TO viktor;
GRANT INSERT ANY TABLE TO viktor; 
```

## Paso 5
Comprobaremos que podemos entrar con los usuarios, si podemos con uno podremos con todos:

**Insertar una imagen de que se pueda conectar el usuario 




















































CREATE TABLE ALUMNOS (   

    dni VARCHAR2(9) PRIMARY KEY,   
    nombre VARCHAR2(20),   
    ciudad VARCHAR2(15) DEFAULT 'Valencia',   
    telefono NUMBER(9),   
    ciclo VARCHAR2(10),   
    nota NUMBER(2,1),   
    id_alumno NUMBER(10)   
)  

PARTITION BY RANGE (id_alumno) (   

    PARTITION particion_1 VALUES LESS THAN (12) TABLESPACE TS_AUSIAS,  
    PARTITION particion_2 VALUES LESS THAN (24) TABLESPACE TS_ENRIC,   
    PARTITION particion_3 VALUES LESS THAN (MAXVALUE) TABLESPACE TS_LLUIS 
); 






-- phpMyAdmin SQL Dump

-- version 5.2.0

-- https://www.phpmyadmin.net/

--

-- Servidor: 127.0.0.1

-- Tiempo de generación: 06-03-2023 a las 20:03:34

-- Versión del servidor: 10.4.24-MariaDB

-- Versión de PHP: 7.4.29



-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

-- START TRANSACTION;

-- SET time_zone = "+00:00";





/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;



--

-- Base de datos: dbhospital

--



-- --------------------------------------------------------



--

-- Estructura de tabla para la tabla consulta

--



CREATE TABLE consulta (

  id_consulta VARCHAR2(45) NOT NULL,

  id_doctor NUMBER(3) NOT NULL,

  id_paciente NUMBER(5) NOT NULL,

  fecha_consulta date NOT NULL

) TABLESPACE TS_HOSPITAL;



--

-- Volcado de datos para la tabla consulta

--




INSERT INTO consulta (id_consulta, id_doctor, id_paciente, fecha_consulta) VALUES('1', 9, 1, TO_DATE('2020-08-30','YYYY-MM-DD'));

INSERT INTO consulta (id_consulta, id_doctor, id_paciente, fecha_consulta) VALUES('10', 1, 1, TO_DATE('2022-09-15','YYYY-MM-DD'));

INSERT INTO consulta (id_consulta, id_doctor, id_paciente, fecha_consulta) VALUES('2', 22, 2, TO_DATE('2021-03-25','YYYY-MM-DD'));

INSERT INTO consulta (id_consulta, id_doctor, id_paciente, fecha_consulta) VALUES('3', 35, 4, TO_DATE('2023-02-23','YYYY-MM-DD'));

INSERT INTO consulta (id_consulta, id_doctor, id_paciente, fecha_consulta) VALUES('4', 9, 7, TO_DATE('2023-01-15','YYYY-MM-DD'));

INSERT INTO consulta (id_consulta, id_doctor, id_paciente, fecha_consulta) VALUES('5', 9, 8, TO_DATE('2022-12-04','YYYY-MM-DD'));

INSERT INTO consulta (id_consulta, id_doctor, id_paciente, fecha_consulta) VALUES('6', 8, 24, TO_DATE('2022-12-03','YYYY-MM-DD'));

INSERT INTO consulta (id_consulta, id_doctor, id_paciente, fecha_consulta) VALUES('7', 1, 25, TO_DATE('2022-11-29','YYYY-MM-DD'));

INSERT INTO consulta (id_consulta, id_doctor, id_paciente, fecha_consulta) VALUES('8', 1, 26, TO_DATE('2022-12-15','YYYY-MM-DD'));

INSERT INTO consulta (id_consulta, id_doctor, id_paciente, fecha_consulta) VALUES('9', 1, 25, TO_DATE('2023-02-10','YYYY-MM-DD'));



-- --------------------------------------------------------



--

-- Estructura de tabla para la tabla cp_poblacion

--



CREATE TABLE cp_poblacion (

  codigo_postal VARCHAR2(5) NOT NULL,

  poblacion VARCHAR2(50) NOT NULL

) TABLESPACE TS_HOSPITAL;



--

-- Volcado de datos para la tabla cp_poblacion

--




INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46001', 'Valencia');

INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46002', 'Valencia');

INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46200', 'Paiporta');

INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46210', 'Picanya');

INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46460', 'Silla');

INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46469', 'Beniparrell');

INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46470', 'Albal');

INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46470', 'Catarroja');

INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46470', 'Massanassa');

INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46900', 'Torrent');

INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46901', 'Torrent');

INSERT INTO cp_poblacion (codigo_postal, poblacion) VALUES('46970', 'Alaquas');



-- --------------------------------------------------------



--

-- Estructura de tabla para la tabla diagnostico

--



CREATE TABLE diagnostico (

  id_diagnostico NUMBER(5) NOT NULL,

  descripcion VARCHAR2(200) NOT NULL,

  consulta_id VARCHAR2(45) NOT NULL

) TABLESPACE TS_HOSPITAL;



--

-- Volcado de datos para la tabla diagnostico

--




INSERT INTO diagnostico (id_diagnostico, descripcion, consulta_id) VALUES(1, 'Alergia a los ácaros', '1');

INSERT INTO diagnostico (id_diagnostico, descripcion, consulta_id) VALUES(2, 'Alergia a la humedad', '2');

INSERT INTO diagnostico (id_diagnostico, descripcion, consulta_id) VALUES(3, 'Alergia a los frutos secos', '3');

INSERT INTO diagnostico (id_diagnostico, descripcion, consulta_id) VALUES(4, 'Alergia al polen', '4');

INSERT INTO diagnostico (id_diagnostico, descripcion, consulta_id) VALUES(5, 'Alergia al pelo de gato', '5');

INSERT INTO diagnostico (id_diagnostico, descripcion, consulta_id) VALUES(6, 'Alergia al ciprés', '10');

INSERT INTO diagnostico (id_diagnostico, descripcion, consulta_id) VALUES(7, 'Neumonía leve', '6');

INSERT INTO diagnostico (id_diagnostico, descripcion, consulta_id) VALUES(8, 'Neumonía grave', '7');



-- --------------------------------------------------------



--

-- Estructura de tabla para la tabla doctor

--



CREATE TABLE doctor (

  id_doctor NUMBER(3) NOT NULL,

  nombre VARCHAR2(50) NOT NULL,

  apellido1 VARCHAR2(50) NOT NULL,

  apellido2 VARCHAR2(50) DEFAULT NULL,

  genero VARCHAR2(8) NOT NULL,

  especialidad VARCHAR2(150) NOT NULL

) TABLESPACE TS_HOSPITAL;



--

-- Volcado de datos para la tabla doctor

--




INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(1, 'Amparo', 'Domingo', 'Hernández', 'mujer', 'neumología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(2, 'Sara', 'Martínez', 'Alberola', 'mujer', 'cardiología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(3, 'Juan', 'Ibáñez', 'Martí', 'hombre', 'dermatología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(4, 'Carmen', 'Romeu', 'Rosaleny', 'mujer', 'endocrinología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(5, 'Sergio', 'Zaragozá', 'Horcajuelo', 'hombre', 'neurología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(6, 'Ariel', 'del Pozo', 'Ribes', 'hombre', 'medicina interna');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(7, 'Arón', 'Sánchez', 'Palomares', 'hombre', 'geriatría');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(8, 'Carles', 'Escribá', 'Santamans', 'hombre', 'anestesiología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(9, 'Alexis', 'Llopis', 'Prats', 'hombre', 'alergología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(10, 'Pedro', 'Montiel', 'Regal', 'hombre', 'reumatología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(11, 'Leonor', 'Rodrigo', 'Ramón', 'mujer', 'toxicología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(12, 'Daniel', 'Ortuño', 'Carrasco', 'hombre', 'pediatría');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(13, 'Diego', 'Alcahut', 'Benavent', 'hombre', 'nutriología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(14, 'Lorena', 'Dies', 'Ivanets', 'mujer', 'medicina familiar');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(15, 'Emilio', 'Ardila', 'Javaloyas', 'hombre', 'cardiología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(16, 'Erik', 'Pla', 'Fernández', 'hombre', 'dermatología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(17, 'María', 'Sanchis', 'Pérez', 'mujer', 'endocrinología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(18, 'Esmeralda', 'Sahuquillo', 'Torrent', 'mujer', 'neurología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(19, 'Guzmán', 'Girbés', 'Plá', 'hombre', 'medicina forense');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(20, 'Imma', 'Ramírez', 'Cebolla', 'mujer', 'geriatría');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(21, 'Francisco', 'Zaragozá', 'Girbés', 'hombre', 'anestesiología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(22, 'Joel', 'Murcia', 'Richart', 'hombre', 'alergología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(23, 'Miguel', 'Pastor', 'Castells', 'hombre', 'reumatología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(24, 'Eva', 'Boluda', 'Rodríguez', 'mujer', 'toxicología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(25, 'Dolores', 'Vázquez', 'Cebriá', 'mujer', 'pediatría');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(26, 'Julio', 'Adam', 'Mulet', 'hombre', 'nutriología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(27, 'Julia', 'Dávila', 'Roig', 'mujer', 'medicina familiar');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(28, 'Peisen', 'Dong', NULL, 'hombre', 'cardiología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(29, 'Pablo', 'Rivero', 'Puigcerver', 'hombre', 'dermatología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(30, 'Rubén', 'Doménech', 'Aranda', 'hombre', 'endocrinología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(31, 'Xavier', 'Yuncal', 'Aliques', 'hombre', 'neurología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(32, 'Telmo', 'Romero', 'Maíques', 'hombre', 'oncología médica');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(33, 'Víctor', 'Gelida', 'Bover', 'hombre', 'oncología radioterápica');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(34, 'Yann', 'Yuncal', 'Lacuesta', 'hombre', 'oncología radioterápica');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(35, 'Mónica', 'Visent', 'Aranda', 'mujer', 'alergología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(36, 'Isabel', 'Montejano', 'Doménech', 'mujer', 'reumatología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(37, 'Leonardo', 'Alcañiz', 'Murcia', 'hombre', 'toxicología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(38, 'Emilia', 'Abella', 'González', 'mujer', 'pediatría');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(39, 'Bernardo', 'Baeza', 'Calatayud', 'hombre', 'nutriología');

INSERT INTO doctor (id_doctor, nombre, apellido1, apellido2, genero, especialidad) VALUES(40, 'Abelardo', 'Martínez', 'Gómez', 'hombre', 'medicina familiar');



-- --------------------------------------------------------



--

-- Estructura de tabla para la tabla medicamento

--



CREATE TABLE medicamento (

  id_medicamento NUMBER(5) NOT NULL,

  nombre VARCHAR2(100) NOT NULL

) TABLESPACE TS_HOSPITAL;



--

-- Volcado de datos para la tabla medicamento

--




INSERT INTO medicamento (id_medicamento, nombre) VALUES(1, 'Ebastel Forte Flash');

INSERT INTO medicamento (id_medicamento, nombre) VALUES(2, 'Zithromax');



-- --------------------------------------------------------



--

-- Estructura de tabla para la tabla medicamento_sintoma

--



CREATE TABLE medicamento_sintoma (

  id_sintoma NUMBER(5) NOT NULL,

  id_medicamento NUMBER(5) NOT NULL,

  dosis_diaria NUMBER NOT NULL

) TABLESPACE TS_HOSPITAL;



--

-- Volcado de datos para la tabla medicamento_sintoma

--




INSERT INTO medicamento_sintoma (id_sintoma, id_medicamento, dosis_diaria) VALUES(1, 1, 1);

INSERT INTO medicamento_sintoma (id_sintoma, id_medicamento, dosis_diaria) VALUES(2, 1, 1);

INSERT INTO medicamento_sintoma (id_sintoma, id_medicamento, dosis_diaria) VALUES(3, 1, 1);

INSERT INTO medicamento_sintoma (id_sintoma, id_medicamento, dosis_diaria) VALUES(4, 1, 1);

INSERT INTO medicamento_sintoma (id_sintoma, id_medicamento, dosis_diaria) VALUES(5, 1, 1);

INSERT INTO medicamento_sintoma (id_sintoma, id_medicamento, dosis_diaria) VALUES(6, 1, 1);

INSERT INTO medicamento_sintoma (id_sintoma, id_medicamento, dosis_diaria) VALUES(7, 2, 3);

INSERT INTO medicamento_sintoma (id_sintoma, id_medicamento, dosis_diaria) VALUES(8, 2, 3);



-- --------------------------------------------------------



--

-- Estructura de tabla para la tabla paciente

--



CREATE TABLE paciente (

  id_paciente NUMBER(5) NOT NULL,

  nombre VARCHAR2(50) NOT NULL,

  apellido1 VARCHAR2(50) NOT NULL,

  apellido2 VARCHAR2(50) DEFAULT NULL,

  genero VARCHAR2(8) NOT NULL,

  f_nacimiento date NOT NULL,

  cod_via NUMBER(5) NOT NULL,

  cod_post VARCHAR2(5) NOT NULL,

  telf_contacto VARCHAR2(15) NOT NULL

) TABLESPACE TS_HOSPITAL;



--

-- Volcado de datos para la tabla paciente

--




INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(1, 'Mónico', 'Naranjo', 'Álvarez', 'mujer', TO_DATE('2000-02-29','YYYY-MM-DD'), 1, '46200', '630697643');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(2, 'Carlos', 'Naranjo', 'Álvarez', 'hombre', TO_DATE('2000-02-29','YYYY-MM-DD'), 1, '46200', '670441572');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(3, 'Alberto', 'Revert', 'Domingo', 'hombre', TO_DATE('2010-08-19','YYYY-MM-DD'), 2, '46200', '645267895');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(4, 'Sara', 'Sánchez', 'Alberola', 'mujer', TO_DATE('1980-02-29','YYYY-MM-DD'), 3, '46200', '630697643');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(5, 'Elvira', 'Mayordomo', 'Casal', 'mujer', TO_DATE('1978-02-28','YYYY-MM-DD'), 4, '46970', '630697643');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(6, 'Manuel', 'Carrasco', 'Turizo', 'hombre', TO_DATE('1984-10-29','YYYY-MM-DD'), 5, '46970', '630697643');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(7, 'Javier', 'Rosaleny', 'Lluesa', 'hombre', TO_DATE('1997-03-25','YYYY-MM-DD'), 6, '46460', '630697643');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(8, 'Pedro', 'Rosaleny', 'Lluesa', 'hombre', TO_DATE('1997-03-25','YYYY-MM-DD'), 6, '46460', '630697643');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(9, 'Ernesto', 'Martínez', 'Samper', 'hombre', TO_DATE('1998-09-18','YYYY-MM-DD'), 7, '46210', '630697643');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(10, 'Isaac', 'Martínez', 'Samper', 'hombre', TO_DATE('2000-05-23','YYYY-MM-DD'), 7, '46210', '630697643');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(11, 'Jose Manuel', 'Seda', 'Parada', 'hombre', TO_DATE('2000-07-12','YYYY-MM-DD'), 8, '46210', '630697643');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(12, 'Isabel', 'Espuig', 'Álvarez ', 'mujer', TO_DATE('2007-04-12','YYYY-MM-DD'), 9, '46900', '673897236');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(13, 'Irene', 'Espuig', 'Álvarez', 'mujer', TO_DATE('2011-07-21','YYYY-MM-DD'), 9, '46900', '673897236');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(14, 'Verónica', 'Espuig', 'Álvarez', 'mujer', TO_DATE('2013-01-10','YYYY-MM-DD'), 9, '46900', '673897236');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(15, 'Juan', 'García', 'López', 'hombre', TO_DATE('1990-05-12','YYYY-MM-DD'), 14, '46901', '962345678');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(16, 'María', 'Martínez', 'González', 'mujer', TO_DATE('1985-08-22','YYYY-MM-DD'), 14, '46901', '911234567');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(17, 'Pedro', 'Hernández', 'Pérez', 'hombre', TO_DATE('1995-11-30','YYYY-MM-DD'), 15, '46900', '963456789');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(18, 'Lucía', 'Sánchez', 'Ruiz', 'mujer', TO_DATE('1982-03-18','YYYY-MM-DD'), 16, '46900', '964567890');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(19, 'Antonio', 'Gómez', 'Sánchez', 'hombre', TO_DATE('1978-06-02','YYYY-MM-DD'), 17, '46900', '965678901');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(20, 'Carmen', 'García', 'Hernández', 'mujer', TO_DATE('1992-09-14','YYYY-MM-DD'), 18, '46469', '966789012');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(21, 'Javier', 'Martín', 'Moreno', 'hombre', TO_DATE('1980-12-26','YYYY-MM-DD'), 19, '46469', '967890123');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(22, 'Laura', 'Pérez', 'González', 'mujer', TO_DATE('1998-01-08','YYYY-MM-DD'), 20, '46469', '968901234');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(23, 'Manuel', 'Rodríguez', 'Hernández', 'hombre', TO_DATE('1975-04-22','YYYY-MM-DD'), 21, '46001', '969012345');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(24, 'Marta', 'González', 'Sánchez', 'mujer', TO_DATE('1988-07-04','YYYY-MM-DD'), 22, '46002', '960123456');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(25, 'Diego', 'Sánchez', 'Gómez', 'hombre', TO_DATE('1991-10-16','YYYY-MM-DD'), 23, '46002', '961234567');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(26, 'Sara', 'Hernández', 'Pérez', 'mujer', TO_DATE('1984-01-28','YYYY-MM-DD'), 24, '46001', '912345678');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(27, 'Pablo', 'García', 'Ruiz', 'hombre', TO_DATE('1979-05-11','YYYY-MM-DD'), 25, '46001', '963456789');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(28, 'Elena', 'Martínez', 'Hernández', 'mujer', TO_DATE('1993-08-23','YYYY-MM-DD'), 26, '46002', '964567890');

INSERT INTO paciente (id_paciente, nombre, apellido1, apellido2, genero, f_nacimiento, cod_via, cod_post, telf_contacto) VALUES(29, 'Jorge', 'Pérez', 'González', 'hombre', TO_DATE('1974-09-11','YYYY-MM-DD'), 26, '46002', '640986754');



-- --------------------------------------------------------



--

-- Estructura de tabla para la tabla paciente_medicamento_tratamiento

--



CREATE TABLE paciente_medicamento_tratamiento (

  id_paciente NUMBER(5) NOT NULL,

  id_medicamento NUMBER(5) NOT NULL,

  dosis_diaria NUMBER NOT NULL

) TABLESPACE TS_HOSPITAL;



--

-- Volcado de datos para la tabla paciente_medicamento_tratamiento

--




INSERT INTO paciente_medicamento_tratamiento (id_paciente, id_medicamento, dosis_diaria) VALUES(1, 1, 1);

INSERT INTO paciente_medicamento_tratamiento (id_paciente, id_medicamento, dosis_diaria) VALUES(2, 1, 1);

INSERT INTO paciente_medicamento_tratamiento (id_paciente, id_medicamento, dosis_diaria) VALUES(4, 1, 1);

INSERT INTO paciente_medicamento_tratamiento (id_paciente, id_medicamento, dosis_diaria) VALUES(7, 1, 1);

INSERT INTO paciente_medicamento_tratamiento (id_paciente, id_medicamento, dosis_diaria) VALUES(8, 1, 1);

INSERT INTO paciente_medicamento_tratamiento (id_paciente, id_medicamento, dosis_diaria) VALUES(10, 1, 1);

INSERT INTO paciente_medicamento_tratamiento (id_paciente, id_medicamento, dosis_diaria) VALUES(24, 2, 3);

INSERT INTO paciente_medicamento_tratamiento (id_paciente, id_medicamento, dosis_diaria) VALUES(25, 2, 3);

INSERT INTO paciente_medicamento_tratamiento (id_paciente, id_medicamento, dosis_diaria) VALUES(26, 2, 3);



-- --------------------------------------------------------



--

-- Estructura de tabla para la tabla sintoma

--



CREATE TABLE sintoma (

  id_sintoma NUMBER(5) NOT NULL,

  descripcion VARCHAR2(200) NOT NULL,

  id_diagnostico NUMBER(5) NOT NULL

) TABLESPACE TS_HOSPITAL;



--

-- Volcado de datos para la tabla sintoma

--




INSERT INTO sintoma (id_sintoma, descripcion, id_diagnostico) VALUES(1, 'Moqueo', 1);

INSERT INTO sintoma (id_sintoma, descripcion, id_diagnostico) VALUES(2, 'Ronchas en la piel', 2);

INSERT INTO sintoma (id_sintoma, descripcion, id_diagnostico) VALUES(3, 'Estornudos', 3);

INSERT INTO sintoma (id_sintoma, descripcion, id_diagnostico) VALUES(4, 'Picor de ojos', 4);

INSERT INTO sintoma (id_sintoma, descripcion, id_diagnostico) VALUES(5, 'Moqueo', 5);

INSERT INTO sintoma (id_sintoma, descripcion, id_diagnostico) VALUES(6, 'Rinitis', 6);

INSERT INTO sintoma (id_sintoma, descripcion, id_diagnostico) VALUES(7, 'Molestia al respirar', 7);

INSERT INTO sintoma (id_sintoma, descripcion, id_diagnostico) VALUES(8, 'Ahogo', 8);



-- --------------------------------------------------------



--

-- Estructura de tabla para la tabla via

--



CREATE TABLE via (

  cod_via NUMBER(5) NOT NULL,

  tipo_via VARCHAR2(30) NOT NULL,

  nom_via VARCHAR2(100) NOT NULL,

  numero NUMBER(4) NOT NULL,

  puerta VARCHAR2(4) NOT NULL,

  escalera VARCHAR2(10) DEFAULT NULL,

  portal VARCHAR2(10) DEFAULT NULL,

  piso VARCHAR2(10) DEFAULT NULL

) TABLESPACE TS_HOSPITAL;



--

-- Volcado de datos para la tabla via

--




INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(1, 'Calle', 'Sant Roc', 44, '2', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(2, 'Calle', 'Catarroja', 32, '7', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(3, 'Avenida', 'Alicante', 102, '10', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(4, 'Avenida', 'del Mediterráneo', 144, '12', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(5, 'Calle', '8 de marzo', 7, '22', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(6, 'Calle', 'Sénia', 38, '31', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(7, 'Rambla', 'de la Independencia', 37, '7', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(8, 'Paseo', 'de Gracia', 22, '9', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(9, 'Ronda', 'Norte', 15, '22', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(10, 'Paseo', 'de la Alameda', 24, '8', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(11, 'Calle', 'del Río Arcos', 8, '2', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(12, 'Calle', 'Andrés Mancebo', 16, '12', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(13, 'Avenida', 'del Pueto', 41, '7', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(14, 'Avenida', 'de la Paz', 22, '7', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(15, 'Calle', 'San Juan', 18, '10', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(16, 'Plaza', 'de España', 16, '1', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(17, 'Calle', 'Alcalá', 9, '20', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(18, 'Paseo', 'del Prado', 2, '8', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(19, 'Calle', 'Gran Vía', 8, '15', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(20, 'Avenida', 'de América', 14, '12', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(21, 'Calle', 'Princesa', 22, '25', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(22, 'Calle', 'Almagro', 7, '30', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(23, 'Calle', 'Velázquez', 10, '35', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(24, 'Avenida', 'de los Reyes Católicos', 13, '40', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(25, 'Calle', 'Fuencarral', 1, '45', NULL, NULL, NULL);

INSERT INTO via (cod_via, tipo_via, nom_via, numero, puerta, escalera, portal, piso) VALUES(26, 'Calle', 'Mayor', 24, '50', NULL, NULL, NULL);



--

-- Índices para tablas volcadas

--



--

-- Indices de la tabla consulta

--

ALTER TABLE consulta

  ADD CONSTRAINT Pk_consulta PRIMARY KEY (id_consulta),

  CREATE INDEX Fk_consulta_doctor ON consulta (id_doctor),

  CREATE INDEX Fk_consulta_paciente ON consulta (id_paciente);



--

-- Indices de la tabla cp_poblacion

--

ALTER TABLE cp_poblacion

  ADD CONSTRAINT Pk_cp_poblacion PRIMARY KEY (codigo_postal,poblacion);



--

-- Indices de la tabla diagnostico

--

ALTER TABLE diagnostico

  ADD CONSTRAINT Pk_diagnostico PRIMARY KEY (id_diagnostico),

  CREATE INDEX Fk_diagnostico_consulta ON diagnostico (consulta_id);



--

-- Indices de la tabla doctor

--

ALTER TABLE doctor

  ADD CONSTRAINT Pk_doctor PRIMARY KEY (id_doctor),

  ADD UNIQUE INDEX Uk_doctor_nom ON doctor (nombre,apellido1,apellido2);



--

-- Indices de la tabla medicamento

--

ALTER TABLE medicamento

  ADD CONSTRAINT Pk_medicamento PRIMARY KEY (id_medicamento);



--

-- Indices de la tabla medicamento_sintoma

--

ALTER TABLE medicamento_sintoma

  ADD CONSTRAINT Pk_medicamento_sintoma PRIMARY KEY (id_sintoma,id_medicamento),

  CREATE INDEX Fk_medicsint_medicamento ON medicamento_sintoma (id_medicamento);



--

-- Indices de la tabla paciente

--

ALTER TABLE paciente

  ADD CONSTRAINT Pk_paciente PRIMARY KEY (id_paciente),

  ADD UNIQUE INDEX Uk_paciente_nom ON paciente (nombre,apellido1,apellido2),

  CREATE INDEX Fk_paciente_via ON paciente (cod_via),

  CREATE INDEX Fk_paciente_cp_poblacion ON paciente (cod_post);



--

-- Indices de la tabla paciente_medicamento_tratamiento

--

ALTER TABLE paciente_medicamento_tratamiento

  ADD CONSTRAINT Pk_paciente_medicamento_tratamiento PRIMARY KEY (id_paciente,id_medicamento),

  CREATE INDEX Fk_pacmedtrat_medicamento ON paciente_medicamento_tratamiento (id_medicamento);



--

-- Indices de la tabla sintoma

--

ALTER TABLE sintoma

  ADD CONSTRAINT Pk_sintoma PRIMARY KEY (id_sintoma),

  CREATE INDEX Fk_sintoma_diagnostico ON sintoma (id_diagnostico);



--

-- Indices de la tabla via

--

ALTER TABLE via

  ADD CONSTRAINT Pk_via PRIMARY KEY (cod_via);



--

-- Restricciones para tablas volcadas

--



--

-- Filtros para la tabla consulta

--

ALTER TABLE consulta

  ADD CONSTRAINT Fk_consulta_doctor FOREIGN KEY (id_doctor) REFERENCES doctor (id_doctor),

  ADD CONSTRAINT Fk_consulta_paciente FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);



--

-- Filtros para la tabla diagnostico

--

ALTER TABLE diagnostico

  ADD CONSTRAINT Fk_diagnostico_consulta FOREIGN KEY (consulta_id) REFERENCES consulta (id_consulta);



--

-- Filtros para la tabla medicamento_sintoma

--

ALTER TABLE medicamento_sintoma

  ADD CONSTRAINT Fk_medicsint_medicamento FOREIGN KEY (id_medicamento) REFERENCES medicamento (id_medicamento),

  ADD CONSTRAINT Fk_medicsint_sintoma FOREIGN KEY (id_sintoma) REFERENCES sintoma (id_sintoma);



--

-- Filtros para la tabla paciente

--

ALTER TABLE paciente

  ADD CONSTRAINT Fk_paciente_cp_poblacion FOREIGN KEY (cod_post) REFERENCES cp_poblacion (codigo_postal),

  ADD CONSTRAINT Fk_paciente_via FOREIGN KEY (cod_via) REFERENCES via (cod_via);



--

-- Filtros para la tabla paciente_medicamento_tratamiento

--

ALTER TABLE paciente_medicamento_tratamiento

  ADD CONSTRAINT Fk_pacmedtrat_medicamento FOREIGN KEY (id_medicamento) REFERENCES medicamento (id_medicamento),

  ADD CONSTRAINT Fk_pacmedtrat_paciente FOREIGN KEY (id_paciente) REFERENCES paciente (id_paciente);



--

-- Filtros para la tabla sintoma

--

ALTER TABLE sintoma

  ADD CONSTRAINT Fk_sintoma_diagnostico FOREIGN KEY (id_diagnostico) REFERENCES diagnostico (id_diagnostico);

COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


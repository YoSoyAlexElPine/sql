-- conexión al PDB, ejecutarlo desde terminal o desde sesión de administración
ALTER SESSION SET container = u5_dml;

ALTER SESSION SET current_schema = u5_admin;

CREATE USER propinas IDENTIFIED BY propinas
    DEFAULT TABLESPACE tbs_tema5
    TEMPORARY TABLESPACE temp
    CONTAINER = CURRENT;

GRANT ALL PRIVILEGES TO propinas;

ALTER SESSION SET current_schema = propinas;

-- por si necesitamos borrar la tabla
-- DROP TABLE propinas;


CREATE TABLE propinas (
    total NUMBER(10 , 2 ) NOT NULL,
    propina NUMBER(8 , 2 ) NOT NULL,
    sexo CHAR(6) DEFAULT NULL,
    fumador NUMBER(1) DEFAULT NULL,
    dia CHAR NOT NULL,
    hora VARCHAR(6) DEFAULT NULL,
    comensales NUMBER(3) DEFAULT 1 CHECK (comensales > 0) NOT NULL
);

COMMIT;

SET AUTOCOMMIT OFF;

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.99,1.01,'mujer',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.34,1.66,'hombre',0,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (21.01,3.5,'hombre',0,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (23.68,3.31,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (24.59,3.61,'mujer',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (25.29,4.71,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (8.77,2,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (26.88,3.12,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.04,1.96,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (14.78,3.23,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.27,1.71,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (35.26,5,'mujer',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.42,1.57,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.43,3,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (14.83,3.02,'mujer',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (21.58,3.92,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.33,1.67,'mujer',0,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.29,3.71,'hombre',0,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.97,3.5,'mujer',0,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.65,3.35,'hombre',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.92,4.08,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.29,2.75,'mujer',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.77,2.23,'mujer',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (39.42,7.58,'hombre',0,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (19.82,3.18,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.81,2.34,'hombre',0,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.37,2,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.69,2,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (21.7,4.3,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (19.65,3,'mujer',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (9.55,1.45,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.35,2.5,'hombre',0,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.06,3,'mujer',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.69,2.45,'mujer',0,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.78,3.27,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (24.06,3.6,'hombre',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.31,2,'hombre',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.93,3.07,'mujer',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.69,2.31,'hombre',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (31.27,5,'hombre',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.04,2.24,'hombre',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.46,2.54,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.94,3.06,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (9.68,1.32,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (30.4,5.6,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.29,3,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (22.23,5,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (32.4,6,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (28.55,2.05,'hombre',0,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.04,3,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.54,2.5,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.29,2.6,'mujer',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (34.81,5.2,'mujer',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (9.94,1.56,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (25.56,4.34,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (19.49,3.51,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (38.01,3,'hombre',1,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (26.41,1.5,'mujer',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (11.24,1.76,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (48.27,6.73,'hombre',0,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.29,3.21,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.81,2,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (11.02,1.98,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.29,3.76,'hombre',1,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.59,2.64,'hombre',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.08,3.15,'hombre',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.45,2.47,'mujer',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (3.07,1,'mujer',1,'S','Cena',1);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.23,2.01,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.01,2.09,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.02,1.97,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.07,3,'mujer',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (26.86,3.14,'mujer',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (25.28,5,'mujer',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (14.73,2.2,'mujer',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.51,1.25,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.92,3.08,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (27.2,4,'hombre',0,'J','Comida',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (22.76,3,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.29,2.71,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (19.44,3,'hombre',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.66,3.4,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.07,1.83,'mujer',0,'J','Comida',1);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (32.68,5,'hombre',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.98,2.03,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (34.83,5.17,'mujer',0,'J','Comida',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.03,2,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.28,4,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (24.71,5.85,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (21.16,3,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (28.97,3,'hombre',1,'V','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (22.49,3.5,'hombre',0,'V','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (5.75,1,'mujer',1,'V','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.32,4.3,'mujer',1,'V','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (22.75,3.25,'mujer',0,'V','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (40.17,4.73,'hombre',1,'V','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (27.28,4,'hombre',1,'V','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.03,1.5,'hombre',1,'V','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (21.01,3,'hombre',1,'V','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.46,1.5,'hombre',0,'V','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (11.35,2.5,'mujer',1,'V','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.38,3,'mujer',1,'V','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (44.3,2.5,'mujer',1,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (22.42,3.48,'mujer',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.92,4.08,'mujer',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.36,1.64,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.49,4.06,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (25.21,4.29,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.24,3.76,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (14.31,4,'mujer',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (14,3,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (7.25,1,'mujer',0,'S','Cena',1);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (38.07,4,'hombre',0,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (23.95,2.55,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (25.71,4,'mujer',0,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.31,3.5,'mujer',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (29.93,5.07,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.65,1.5,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.43,1.8,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (24.08,2.92,'mujer',0,'J','Comida',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (11.69,2.31,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.42,1.68,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (14.26,2.5,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.95,2,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.48,2.52,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (29.8,4.2,'mujer',0,'J','Comida',6);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (8.52,1.48,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (14.52,2,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (11.38,2,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (22.82,2.18,'hombre',0,'J','Comida',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (19.08,1.5,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.27,2.83,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (11.17,1.5,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.26,2,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.26,3.25,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (8.51,1.25,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.33,2,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (14.15,2,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16,2,'hombre',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.16,2.75,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.47,3.5,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (34.3,6.7,'hombre',0,'J','Comida',6);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (41.19,5,'hombre',0,'J','Comida',5);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (27.05,5,'mujer',0,'J','Comida',6);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.43,2.3,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (8.35,1.5,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.64,1.36,'mujer',0,'J','Comida',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (11.87,1.63,'mujer',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (9.78,1.73,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (7.51,2,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (14.07,2.5,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.13,2,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.26,2.74,'hombre',0,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (24.55,2,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (19.77,2,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (29.85,5.14,'mujer',0,'D','Cena',5);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (48.17,5,'hombre',0,'D','Cena',6);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (25,3.75,'mujer',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.39,2.61,'mujer',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.49,2,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (21.5,3.5,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.66,2.5,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.21,2,'mujer',0,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.81,2,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.51,3,'mujer',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (24.52,3.48,'hombre',0,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.76,2.24,'hombre',0,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (31.71,4.5,'hombre',0,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.59,1.61,'mujer',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.63,2,'mujer',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (50.81,10,'hombre',1,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.81,3.16,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (7.25,5.15,'hombre',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (31.85,3.18,'hombre',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.82,4,'hombre',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (32.9,3.11,'hombre',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.89,2,'hombre',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (14.48,2,'hombre',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (9.6,4,'mujer',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (34.63,3.55,'hombre',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (34.65,3.68,'hombre',1,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (23.33,5.65,'hombre',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (45.35,3.5,'hombre',1,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (23.17,6.5,'hombre',1,'D','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (40.55,3,'hombre',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.69,5,'hombre',0,'D','Cena',5);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.9,3.5,'mujer',1,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (30.46,2,'hombre',1,'D','Cena',5);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.15,3.5,'mujer',1,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (23.1,4,'hombre',1,'D','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.69,1.5,'hombre',1,'D','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (19.81,4.19,'mujer',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (28.44,2.56,'hombre',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.48,2.02,'hombre',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.58,4,'hombre',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (7.56,1.44,'hombre',0,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.34,2,'hombre',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (43.11,5,'mujer',1,'J','Comida',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13,2,'mujer',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.51,2,'hombre',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.71,4,'hombre',1,'J','Comida',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.74,2.01,'mujer',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13,2,'mujer',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.4,2.5,'mujer',1,'J','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.53,4,'hombre',1,'J','Comida',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.47,3.23,'mujer',1,'J','Comida',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (26.59,3.41,'hombre',1,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (38.73,3,'hombre',1,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (24.27,2.03,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.76,2.23,'mujer',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (30.06,2,'hombre',1,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (25.89,5.16,'hombre',1,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (48.33,9,'hombre',0,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.27,2.5,'mujer',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (28.17,6.5,'mujer',1,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.9,1.1,'mujer',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (28.15,3,'hombre',1,'S','Cena',5);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (11.59,1.5,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (7.74,1.44,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (30.14,3.09,'mujer',1,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.16,2.2,'hombre',1,'V','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.42,3.48,'mujer',1,'V','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (8.58,1.92,'hombre',1,'V','Comida',1);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.98,3,'mujer',0,'V','Comida',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.42,1.58,'hombre',1,'V','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (16.27,2.5,'mujer',1,'V','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.09,2,'mujer',1,'V','Comida',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (20.45,3,'hombre',0,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (13.28,2.72,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (22.12,2.88,'mujer',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (24.01,2,'hombre',1,'S','Cena',4);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.69,3,'hombre',1,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (11.61,3.39,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.77,1.47,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (15.53,3,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (10.07,1.25,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (12.6,1,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (32.83,1.17,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (35.83,4.67,'mujer',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (29.03,5.92,'hombre',0,'S','Cena',3);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (27.18,2,'mujer',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (22.67,2,'hombre',1,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (17.82,1.75,'hombre',0,'S','Cena',2);

INSERT INTO propinas(total,propina,sexo,fumador,dia,hora,comensales) VALUES (18.78,3,'mujer',0,'J','Cena',2);

COMMIT;

SET AUTOCOMMIT ON;
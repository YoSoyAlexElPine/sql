-- conexión al PDB, ejecutarlo desde terminal o desde sesión de administración
ALTER SESSION SET container = u5_dml;

ALTER SESSION SET current_schema = u5_admin;

CREATE USER iris IDENTIFIED BY iris
    DEFAULT TABLESPACE tbs_tema5
    TEMPORARY TABLESPACE temp
    CONTAINER = CURRENT;

GRANT ALL PRIVILEGES TO iris;

ALTER SESSION SET current_schema = iris;

-- por si necesitamos borrar la tabla
-- DROP TABLE iris;

CREATE TABLE iris (
    sepalo_longitud NUMBER(4 , 1 ) NOT NULL,
    sepalo_ancho NUMBER(4 , 1 ) NOT NULL,
    petalo_longitud NUMBER(4 , 1 ) NOT NULL,
    petalo_ancho NUMBER(4 , 1 ) NOT NULL,
    variedad VARCHAR(10) NOT NULL
);

SET AUTOCOMMIT OFF;

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.1,3.5,1.4,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.9,3,1.4,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.7,3.2,1.3,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.6,3.1,1.5,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5,3.6,1.4,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.4,3.9,1.7,.4,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.6,3.4,1.4,.3,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5,3.4,1.5,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.4,2.9,1.4,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.9,3.1,1.5,.1,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.4,3.7,1.5,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.8,3.4,1.6,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.8,3,1.4,.1,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.3,3,1.1,.1,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.8,4,1.2,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.7,4.4,1.5,.4,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.4,3.9,1.3,.4,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.1,3.5,1.4,.3,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.7,3.8,1.7,.3,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.1,3.8,1.5,.3,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.4,3.4,1.7,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.1,3.7,1.5,.4,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.6,3.6,1,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.1,3.3,1.7,.5,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.8,3.4,1.9,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5,3,1.6,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5,3.4,1.6,.4,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.2,3.5,1.5,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.2,3.4,1.4,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.7,3.2,1.6,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.8,3.1,1.6,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.4,3.4,1.5,.4,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.2,4.1,1.5,.1,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.5,4.2,1.4,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.9,3.1,1.5,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5,3.2,1.2,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.5,3.5,1.3,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.9,3.6,1.4,.1,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.4,3,1.3,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.1,3.4,1.5,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5,3.5,1.3,.3,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.5,2.3,1.3,.3,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.4,3.2,1.3,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5,3.5,1.6,.6,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.1,3.8,1.9,.4,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.8,3,1.4,.3,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.1,3.8,1.6,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.6,3.2,1.4,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.3,3.7,1.5,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5,3.3,1.4,.2,'setosa');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7,3.2,4.7,1.4,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.4,3.2,4.5,1.5,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.9,3.1,4.9,1.5,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.5,2.3,4,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.5,2.8,4.6,1.5,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.7,2.8,4.5,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.3,3.3,4.7,1.6,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.9,2.4,3.3,1,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.6,2.9,4.6,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.2,2.7,3.9,1.4,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5,2,3.5,1,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.9,3,4.2,1.5,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6,2.2,4,1,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.1,2.9,4.7,1.4,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.6,2.9,3.6,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.7,3.1,4.4,1.4,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.6,3,4.5,1.5,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.8,2.7,4.1,1,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.2,2.2,4.5,1.5,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.6,2.5,3.9,1.1,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.9,3.2,4.8,1.8,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.1,2.8,4,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.3,2.5,4.9,1.5,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.1,2.8,4.7,1.2,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.4,2.9,4.3,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.6,3,4.4,1.4,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.8,2.8,4.8,1.4,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.7,3,5,1.7,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6,2.9,4.5,1.5,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.7,2.6,3.5,1,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.5,2.4,3.8,1.1,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.5,2.4,3.7,1,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.8,2.7,3.9,1.2,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6,2.7,5.1,1.6,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.4,3,4.5,1.5,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6,3.4,4.5,1.6,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.7,3.1,4.7,1.5,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.3,2.3,4.4,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.6,3,4.1,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.5,2.5,4,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.5,2.6,4.4,1.2,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.1,3,4.6,1.4,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.8,2.6,4,1.2,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5,2.3,3.3,1,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.6,2.7,4.2,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.7,3,4.2,1.2,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.7,2.9,4.2,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.2,2.9,4.3,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.1,2.5,3,1.1,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.7,2.8,4.1,1.3,'versicolor');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.3,3.3,6,2.5,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.8,2.7,5.1,1.9,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.1,3,5.9,2.1,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.3,2.9,5.6,1.8,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.5,3,5.8,2.2,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.6,3,6.6,2.1,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (4.9,2.5,4.5,1.7,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.3,2.9,6.3,1.8,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.7,2.5,5.8,1.8,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.2,3.6,6.1,2.5,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.5,3.2,5.1,2,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.4,2.7,5.3,1.9,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.8,3,5.5,2.1,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.7,2.5,5,2,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.8,2.8,5.1,2.4,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.4,3.2,5.3,2.3,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.5,3,5.5,1.8,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.7,3.8,6.7,2.2,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.7,2.6,6.9,2.3,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6,2.2,5,1.5,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.9,3.2,5.7,2.3,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.6,2.8,4.9,2,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.7,2.8,6.7,2,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.3,2.7,4.9,1.8,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.7,3.3,5.7,2.1,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.2,3.2,6,1.8,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.2,2.8,4.8,1.8,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.1,3,4.9,1.8,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.4,2.8,5.6,2.1,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.2,3,5.8,1.6,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.4,2.8,6.1,1.9,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.9,3.8,6.4,2,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.4,2.8,5.6,2.2,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.3,2.8,5.1,1.5,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.1,2.6,5.6,1.4,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (7.7,3,6.1,2.3,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.3,3.4,5.6,2.4,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.4,3.1,5.5,1.8,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6,3,4.8,1.8,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.9,3.1,5.4,2.1,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.7,3.1,5.6,2.4,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.9,3.1,5.1,2.3,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.8,2.7,5.1,1.9,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.8,3.2,5.9,2.3,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.7,3.3,5.7,2.5,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.7,3,5.2,2.3,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.3,2.5,5,1.9,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.5,3,5.2,2,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (6.2,3.4,5.4,2.3,'virginica');

INSERT INTO iris(sepalo_longitud,sepalo_ancho,petalo_longitud,petalo_ancho,variedad) VALUES (5.9,3,5.1,1.8,'virginica');

COMMIT;

SET AUTOCOMMIT ON;

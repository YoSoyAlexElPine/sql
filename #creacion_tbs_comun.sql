-- EJECUTAR DESDE EL CDB$ROOT EN MODO SYSDBA

show pdbs;

SELECT
    tablespace_name,
    file_name,
    bytes / power(2, 20)
FROM
    dba_data_files;

ALTER SESSION SET container = cdb$root;

CREATE PLUGGABLE DATABASE u5_dml 
    ADMIN USER u5_admin 
        IDENTIFIED BY abcd1234 
        ROLES = ( connect, dba )
    FILE_NAME_CONVERT = ( '/opt/oracle/oradata/XE/pdbseed/', '/opt/oracle/oradata/XE/u5_dml/' )
    STORAGE ( MAXSIZE 4G )
PATH_PREFIX = '/opt/oracle/oradata/XE/u5_dml/';

ALTER PLUGGABLE DATABASE u5_dml OPEN;

ALTER SESSION SET container = u5_dml;

ALTER SESSION SET current_schema = u5_dml;

CREATE TABLESPACE tbs_tema5
    DATAFILE '/opt/oracle/oradata/XE/u5_dml/tbs_tema5.dbf' SIZE 100M
    AUTOEXTEND ON NEXT 50M MAXSIZE UNLIMITED;

ALTER PLUGGABLE DATABASE u5_dml DEFAULT TABLESPACE tbs_tema5;
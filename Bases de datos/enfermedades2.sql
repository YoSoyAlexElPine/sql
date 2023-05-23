-- conexión al PDB, ejecutarlo desde terminal o desde sesión de administración
ALTER SESSION SET container = u5_dml;

ALTER SESSION SET current_schema = u5_admin;

CREATE USER enfermedades2 IDENTIFIED BY enfermedades2
    DEFAULT TABLESPACE tbs_tema5
    TEMPORARY TABLESPACE temp
    CONTAINER = CURRENT;

GRANT ALL PRIVILEGES TO enfermedades2;

ALTER SESSION SET current_schema = enfermedades2;

-- por si necesitamos borrar las tablas
-- DROP TABLE analitica;
-- DROP TABLE problematica;


-- edad: edad del paciente [años]
-- sexo: sexo del paciente [M: Masculino, F: Femenino]
-- tipoDolorToracico: tipo de dolor torácico [TA: angina típica, ATA: angina atípica, NAP: dolor no anginoso, ASY: asintomático]
-- PAreposo: presión arterial en reposo [mm Hg]
-- colesterol: colesterol sérico [mm/dl]
-- azucarAyunas: azúcar en sangre en ayunas [1: si el nivel de azúcar en ayunas > 120 mg/dl, 0: en caso contrario]
-- ECGreposo: resultados del electrocardiograma en reposo [Normal: normal, ST: con anomalías en la onda ST-T (inversión de la onda T y/o elevación o depresión del ST > 0,05 mV), HVI: hipertrofia ventricular izquierda probable o definitiva según los criterios de Estes]
-- maxHR: frecuencia cardíaca máxima alcanzada [Valor numérico entre 60 y 202]
-- anginaEjerc: angina inducida por el ejercicio [S: Sí, N: No]
-- depresion: ST [Valor numérico medido en depresión]
-- enfCard cardíaca: clase de salida [1: enfermedad cardíaca, 0: normal]

CREATE TABLE analitica (
    id CHAR(20) NOT NULL,
    edad NUMBER(3) NOT NULL,
    sexo CHAR(1) NOT NULL,
    tipoDolorToracico CHAR(3) NOT NULL,
    PAreposo NUMBER(4) NOT NULL,
    colesterol NUMBER(4) NOT NULL,
    azucarAyunas NUMBER(1) NOT NULL,
    ECGreposo VARCHAR2(6) NOT NULL,
    maxHR NUMBER(4) NOT NULL,
    CONSTRAINT PK_analitica PRIMARY KEY (id)
);

CREATE TABLE problematica (
    id CHAR(20) NOT NULL,
    anginaEjerc CHAR(1) NOT NULL,
    depresion NUMBER(5,2) NOT NULL,
    enfCard NUMBER(1) NOT NULL,
    CONSTRAINT PK_problematica PRIMARY KEY (id),
    CONSTRAINT fk_problematica_1 FOREIGN KEY (id)
        REFERENCES analitica (id)
);

CREATE INDEX idx_prob_dep ON problematica (depresion);
CREATE INDEX idx_prob_cor ON problematica (enfCard);
CREATE INDEX idx_prob_angina ON problematica (anginaEjerc);

SET AUTOCOMMIT OFF;

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('005ca77f0a82442a2a36',57,'M','ASY',160,0,1,'Normal',98);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0066328485e84664ae5a',45,'M','NAP',135,192,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('008da106bab758dd8d7f',29,'M','ATA',140,263,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('008efab1a9c9cc35ed9a',65,'M','TA',140,252,0,'Normal',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('00a69e2bc3e28699c7a8',57,'M','ASY',132,207,0,'Normal',168);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('00a90a012374b7f23e83',39,'M','ATA',130,215,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('00c4e5f7c24a74b9a0c5',50,'M','ASY',144,349,0,'LVH',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('00ff9b3c2145ce21a614',46,'M','ASY',140,311,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('013282798d239aaf76f7',62,'M','ASY',115,0,1,'Normal',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0201ccc2d50cc51df685',38,'M','ASY',120,282,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('02108947ab4c9f41a89e',59,'F','ASY',174,249,0,'Normal',143);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0251139dfa033ab83381',60,'M','ASY',117,230,1,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('026480bc8f13e4cddb72',48,'M','ATA',100,159,0,'Normal',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('02a391d3845f7011d01d',54,'M','NAP',150,195,0,'Normal',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('02e595092a429c3127ad',41,'M','ATA',135,203,0,'Normal',132);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('030561657982d7182054',55,'M','ATA',160,292,1,'Normal',143);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0337473de6b7d0d60c7a',63,'F','ATA',140,195,0,'Normal',179);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('03668f27cac6c57ef410',61,'M','ASY',138,166,0,'LVH',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('03bdcc3b96133ef4a36b',52,'M','NAP',138,223,0,'Normal',169);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('04037a1bbb304ad549b9',56,'M','ASY',155,342,1,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('041762e63be3d800913f',67,'M','TA',142,270,1,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('04bb1063cfbaf536e76a',43,'M','ASY',100,0,1,'Normal',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('04f831889a3e31f2a382',59,'M','ASY',178,0,1,'LVH',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('05119692af9445d1a2b4',67,'M','ASY',120,229,0,'LVH',129);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('05170b9753a2ccc13a0e',43,'M','ASY',110,211,0,'Normal',161);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('051d5406835646555541',54,'M','ATA',160,305,0,'Normal',175);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('05484af58373a92d2e77',56,'M','ATA',120,240,0,'Normal',169);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0580510996f4d6924fd9',55,'M','ASY',120,0,0,'ST',92);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('058cb386505fe46dce8f',53,'F','ATA',140,216,0,'Normal',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('060bbfba8cc415517e2e',43,'M','ATA',142,207,0,'Normal',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('06a319605b20c2aaa985',53,'M','ATA',120,181,0,'Normal',132);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('07192329c490f0300244',41,'F','ATA',105,198,0,'Normal',168);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('072079f3980006c66a3f',55,'M','ASY',116,186,1,'ST',102);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0724315cf6b8db3f62e3',61,'M','ASY',140,207,0,'LVH',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('07339c81dbadd1ec2d86',58,'M','ASY',120,0,0,'LVH',106);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('075757a8439e991adc37',58,'M','NAP',140,179,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('075f80705eb90a20804d',48,'M','ASY',120,260,0,'Normal',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0780af1e90b677ed3acc',50,'M','NAP',129,196,0,'Normal',163);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('078ba9952022e34ecc9a',52,'F','ASY',130,180,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('07af8c89495a7f098d15',52,'M','ATA',140,100,0,'Normal',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('07bc33fb2298249bdde7',68,'M','ASY',138,0,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('08020ae12393eb9b8d4f',65,'M','ASY',140,306,1,'Normal',87);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('08ac2619d79678f934b3',60,'M','ASY',130,186,1,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('08ce629e407a2a36a95c',44,'M','ASY',130,209,0,'ST',127);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('08d2e1e1ffd57abb04ce',65,'F','NAP',160,360,0,'LVH',151);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('09a839160cd9b9a9811a',50,'M','ASY',144,200,0,'LVH',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('09b241a43627ecec7f9d',56,'M','NAP',137,208,1,'ST',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('09cc9c5f21e6db0e5d02',59,'M','ASY',130,126,0,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0a5b63da826feeabe050',65,'M','TA',138,282,1,'LVH',174);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0b2338c45193981dc12a',72,'M','NAP',120,214,0,'Normal',102);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0c1f348b484c9fe59621',56,'F','NAP',130,219,0,'ST',164);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0c87e72a39cc579d9d42',45,'M','ASY',130,219,0,'ST',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0cb2cc107dcd4f345583',56,'M','ASY',120,0,0,'ST',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0cba09ed03fbdbd22ec8',69,'M','NAP',140,254,0,'LVH',146);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0dcef7418db4e7c78a85',61,'M','ATA',139,283,0,'Normal',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0e208f17ebe26fadde95',40,'M','NAP',130,215,0,'Normal',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0e3d00d72cd84fa3f737',61,'M','ASY',130,0,0,'LVH',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0e4a873fac8e3bd6eb23',36,'M','ATA',120,267,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0e5d9f4c4f92e71539dd',59,'F','ATA',130,188,0,'Normal',124);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0e5f31b17ed18ab74f66',54,'M','ATA',192,283,0,'LVH',195);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0eba0a3a9e06a8fbe605',40,'M','ASY',125,0,1,'Normal',165);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0ee5b3cdc684b245ba17',58,'M','ASY',125,300,0,'LVH',171);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0f05456c4af52f3256a5',57,'M','ASY',122,264,0,'LVH',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0f0c81c864a0182a4e82',51,'M','ASY',130,0,1,'ST',163);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0f47ce4c05ba698298b6',55,'F','ATA',130,394,0,'LVH',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0f6d1da71fcc5639b090',53,'M','NAP',130,197,1,'LVH',152);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0faee4a23fc5bb06ec6a',61,'M','ASY',120,260,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('0fafb03f8c0963c04a31',42,'M','NAP',160,147,0,'Normal',146);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('100d91bf436ce20d4a24',56,'M','ATA',124,224,1,'Normal',161);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('103eb0df97489b22c14a',54,'M','ATA',132,182,0,'ST',141);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('10c14b93e58fe5b0bc4f',37,'F','ATA',120,260,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1159e76f6e906ca3e4f7',63,'F','ASY',108,269,0,'Normal',169);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1179857fe676469486cb',50,'M','ASY',133,218,0,'Normal',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('117cf48f978e1469d159',34,'M','ATA',150,214,0,'ST',168);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('11d2e5f86fb82e84342d',71,'M','ASY',130,221,0,'ST',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('123404b9a806ae4f7a69',56,'M','ASY',170,388,0,'ST',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('12b60640d919244079e0',52,'F','ATA',120,210,0,'Normal',148);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('12ececdd5d9d2e784d8d',60,'M','ASY',130,186,1,'LVH',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('143b6ec9df8df5ed37b3',36,'M','NAP',130,209,0,'Normal',178);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('14b1b84a51bcb63e4b64',52,'F','ATA',140,225,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('14bd5e96a96ec025ce1e',52,'M','ASY',130,225,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('150f42da68039ae3973e',56,'M','ASY',130,283,1,'LVH',103);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('15aac02ed43a0c3f90f0',57,'M','ASY',110,0,1,'ST',131);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('160956a8045abc636e16',59,'M','ASY',120,0,0,'Normal',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1652b6c5715b9cb04742',54,'M','ASY',130,0,1,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1686f4d0b39a631fce01',48,'F','ASY',150,227,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('16b50157884976c1f12d',70,'M','ASY',115,0,0,'ST',92);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('16c547049ddc2a5248d5',52,'M','ASY',165,0,1,'Normal',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('16d15917ceffd644964d',36,'M','ASY',110,0,1,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('16d419f8f2a497d62596',51,'F','ASY',130,305,0,'Normal',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1748d76d0f74343991f1',59,'M','ASY',135,0,0,'Normal',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1761ad63d0fdbdf1e561',43,'F','NAP',122,213,0,'Normal',165);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('17c473725bb6410af53e',59,'M','ASY',154,0,0,'ST',131);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('181df1c6fb5e26a88d03',46,'F','ASY',130,238,0,'Normal',90);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('183050239e4f78ba23f9',55,'M','ASY',150,160,0,'ST',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('184b33463d4aa8210de5',59,'M','NAP',130,318,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('187dbe61a92e8e1e9b5a',55,'F','ATA',135,250,0,'LVH',161);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('18db773c3cfd51a47e0c',54,'M','ASY',130,242,0,'Normal',91);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1940b467acf46b8bffe6',62,'M','TA',135,139,0,'ST',137);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('19f9ce2714e84c2daac7',55,'M','ASY',132,353,0,'Normal',132);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1a0d0ece3ed0c966080d',55,'F','ATA',122,320,0,'Normal',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1a4299d1a0bf6d2141a1',58,'M','ATA',130,251,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1a4e9047f5d3a7719c2c',63,'M','ASY',150,0,0,'Normal',86);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1a68e09672f8cb558c51',61,'M','ASY',120,282,0,'ST',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1a7cc7a2d4214c5da774',49,'M','ASY',140,234,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1acc5be5a3330776a848',52,'M','ASY',135,0,1,'Normal',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1b140b69ad007b4491f0',45,'M','NAP',130,236,0,'Normal',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1b39a9d16ba2dcfc5c59',44,'M','ATA',150,288,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1b47930ac22d52a8244a',47,'F','ATA',140,257,0,'Normal',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1b9679a48c2741bccf1b',43,'M','ASY',122,0,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1c520dc11fb49cce56bc',56,'M','ASY',120,85,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1d0138caefac74406987',47,'M','TA',110,249,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1d04f378a0177d185469',61,'M','ASY',110,0,1,'Normal',113);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1d102cab320054bda840',47,'F','ASY',120,205,0,'Normal',98);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1d7ba87490feb2e628f4',62,'M','ATA',128,208,1,'LVH',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1dd9e5843d317a10dc10',44,'M','ASY',110,197,0,'LVH',177);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1de29f41a5eb0dfec84a',63,'M','ASY',150,0,1,'ST',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1deb04ca8abf324497d4',40,'M','ATA',130,275,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1e19e2aeecb91e081caa',58,'M','ASY',116,0,0,'Normal',124);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1e8a5e45e9196053ef14',46,'M','ASY',120,249,0,'LVH',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1eac359b2477953e26cf',51,'M','ASY',132,227,1,'ST',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1ebb2aea970cc0c5e921',66,'M','ASY',120,302,0,'LVH',151);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1f0514b2c6b77c5f7637',45,'M','ASY',104,208,0,'LVH',148);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1f19db2c16ea17176535',55,'M','ASY',122,223,1,'ST',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('1fada3f3ce12c4b3e39f',28,'M','ATA',130,132,0,'LVH',185);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2026f5bd716635a5fcf5',58,'M','ASY',170,0,1,'ST',105);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2108e09951118bcf653f',33,'F','ASY',100,246,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2185a085c1cdaa690cf8',44,'M','NAP',120,226,0,'Normal',169);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('21e3e23d5b126f5a6ef0',35,'F','TA',120,160,0,'ST',185);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('21eb56e198d89fbe6563',54,'F','NAP',135,304,1,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2207146e5480474bfab3',38,'M','ASY',110,289,0,'Normal',105);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('222937564647e097f58e',63,'M','TA',145,233,1,'LVH',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('225b0a71237de46110c2',37,'F','NAP',130,211,0,'Normal',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('22642e953103029afec9',75,'M','ASY',136,225,0,'Normal',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('228c7736416a987b2be5',55,'M','ASY',172,260,0,'Normal',73);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('232565526d42e517d846',55,'M','ASY',140,268,0,'Normal',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('24602682bf556398b51c',62,'M','ASY',150,0,1,'ST',78);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('246f21c013c3127f8f7e',65,'M','ASY',155,0,0,'Normal',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('24935ca22b08dd85cce9',58,'F','ATA',136,319,1,'LVH',152);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('250f0d57d8ce96f8a5d7',61,'M','TA',142,200,1,'ST',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('257120de14f6a3402583',45,'M','ATA',128,308,0,'LVH',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('259fcefb25fb5f6d354a',53,'M','NAP',130,246,1,'LVH',173);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('259fea610b528d06fdf1',42,'M','ATA',150,268,0,'Normal',136);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('25f91c3fec250e855d94',57,'F','ASY',140,241,0,'Normal',123);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('260b90c701f65c454fc3',52,'M','ASY',130,298,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2617f32dff72ec7a4741',68,'M','ASY',144,193,1,'Normal',141);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2684c42def1f1babb733',62,'M','ATA',120,281,0,'LVH',103);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('275e86a93ea62e0d8bde',46,'M','ASY',180,280,0,'ST',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('281e8598421a52fc47a5',51,'F','NAP',150,200,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('283c3e72eb9127b23994',38,'F','ASY',110,0,0,'Normal',156);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('28b492e7f1002c1ab63e',53,'F','NAP',120,274,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('28d05cddb1ccbdf3a43a',57,'M','NAP',150,168,0,'Normal',174);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('28ed4ffd396b58cc016d',41,'M','ASY',110,289,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('290514d47832fe8f170e',56,'M','ATA',120,236,0,'Normal',178);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('293577953124be8cdb7f',38,'M','ASY',110,190,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('29944a9095cfb9283321',58,'M','ASY',128,259,0,'LVH',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('29c21f1e7830abb4f690',65,'M','ASY',144,312,0,'LVH',113);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('29ec519c133f51d2b982',66,'F','TA',150,226,0,'Normal',114);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2a3fc0655e63515234eb',38,'F','ATA',120,275,0,'Normal',129);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2a8738e3c8717b3e3776',59,'M','ASY',164,176,1,'LVH',90);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2abdad2112ebe19c1556',35,'M','ATA',122,192,0,'Normal',174);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2b0376696e68aeae269f',40,'M','ASY',152,223,0,'Normal',181);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2b51a209835fb219be81',48,'M','ASY',160,268,0,'Normal',103);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2b554b465345c14eca79',55,'M','NAP',0,0,0,'Normal',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2b89a721ea9de960972e',54,'F','ATA',120,230,1,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2b8c42dacb1fb67bf656',59,'M','ASY',110,239,0,'LVH',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2bb3452329f8a304e1e1',49,'M','ASY',130,341,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2bce14da845b6166ab7f',77,'M','ASY',125,304,0,'LVH',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2c3ee4561fcdab111be9',64,'M','TA',110,211,0,'LVH',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2cbf9e32694883e32058',45,'M','NAP',110,0,0,'Normal',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2e130addd854f4c5524f',53,'M','ASY',154,0,1,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2e92adbac83fd20251ea',72,'M','ASY',143,211,0,'Normal',109);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2f2c18fe676af8ccadc8',46,'M','TA',140,272,1,'Normal',175);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2f76012ca62619f825b8',58,'F','ATA',180,393,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2f8a6500515c3171a949',39,'M','ATA',120,200,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2fbc5d40de795279d066',57,'F','ASY',180,347,0,'ST',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2ffa70ebfd8590abf642',53,'F','NAP',128,216,0,'LVH',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('2ffac86e793cf6ea4197',67,'F','ASY',106,223,0,'Normal',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('31090fc11adcd02c74db',57,'M','ASY',140,0,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('310d560851e2e6751cf8',65,'M','ASY',150,235,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3165a3cc246620351e7a',52,'M','ASY',170,223,0,'Normal',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3191e4aba47807c5b0d4',69,'F','TA',140,239,0,'Normal',151);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3207dcfa33a05ca7c2d3',57,'M','ATA',140,265,0,'ST',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('32222501edc4f009d420',40,'M','NAP',130,281,0,'Normal',167);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3237944cafb1744530c4',53,'M','NAP',160,0,1,'LVH',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('325d2b89e3e32da103e9',49,'F','NAP',160,180,0,'Normal',156);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('330b4bbb170c51f4a6d6',59,'M','NAP',150,212,1,'Normal',157);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('33c7ea68ed2ccf92d3e8',62,'M','ASY',115,0,1,'Normal',72);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3482893bbd16513294ce',53,'M','ASY',120,246,0,'Normal',116);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3499d950f3fa9bda988d',63,'F','ASY',150,407,0,'LVH',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('351d383ee29ea6b07faf',61,'M','ASY',110,0,1,'Normal',108);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('353c2074e7b41a825abd',57,'M','ASY',156,173,0,'LVH',119);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('358cbc084fa35e0f037e',46,'M','ASY',120,277,0,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('360e536a28c82ad249a1',39,'M','ASY',118,219,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('361897723e121208d3e8',41,'M','ATA',125,269,0,'Normal',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('36392431ec9a365c9fbf',46,'M','ASY',110,202,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('36b310782db410f6e53d',47,'M','ASY',110,275,0,'LVH',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('36f9fd6a60361447e8d7',56,'M','ASY',137,282,1,'Normal',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('375c93bfef95a9f3d94d',49,'M','NAP',118,149,0,'LVH',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('375e8fdd3aa5c1e69409',63,'M','ASY',110,252,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3835e3ad907aa5588f43',57,'M','ASY',165,289,1,'LVH',124);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('38b5ff881859ec187cf8',65,'F','NAP',155,269,0,'Normal',148);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('391f1920a1e918227b10',42,'M','NAP',134,240,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('39539c95db5c2417746b',52,'M','NAP',122,0,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('39898696eb4eaccfb804',42,'F','NAP',120,209,0,'Normal',173);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('39c561bf6ee1e94287d9',60,'F','ASY',150,258,0,'LVH',157);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('39fe73257533cba0433a',56,'M','ATA',130,221,0,'LVH',163);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3a06453505803d657aaf',64,'F','ASY',142,276,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3a23701eedb201509aee',41,'M','ASY',120,237,1,'Normal',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3a311f75949ebc9a657b',30,'F','TA',170,237,0,'ST',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3ac84ebe707846be363c',61,'M','ASY',141,292,0,'ST',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3adc1cde526beef4015b',48,'M','NAP',124,255,1,'Normal',175);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3b6b80649edf69e65ec1',60,'M','ASY',120,0,0,'Normal',133);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3c1d798d74988e303a97',48,'M','ASY',160,329,0,'Normal',92);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3c6bdb49d63078293186',41,'M','ATA',110,235,0,'Normal',153);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3c6ead4c1cad9f107327',40,'M','ASY',120,466,1,'Normal',152);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3c7635cc62f5d52c8004',75,'M','ASY',160,310,1,'Normal',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3cd27a9495010914d084',65,'M','ASY',115,0,0,'Normal',93);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3cdd4150fa498e521987',46,'F','ASY',138,243,0,'LVH',152);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3d275b79a52f91a2bd4b',56,'M','ASY',125,0,1,'Normal',103);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3de66d2c0669732fd686',63,'M','ASY',160,267,1,'ST',88);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3e4e20a27465202df850',72,'M','ASY',160,123,1,'LVH',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3e53003b5a28724b17c2',59,'M','ASY',125,222,0,'Normal',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3efacce4eb39e23e8ae6',47,'M','NAP',130,253,0,'Normal',179);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3f12f49d67b6874cc38c',67,'F','NAP',152,277,0,'Normal',172);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('3f48441a6b018677adc4',54,'F','ATA',132,288,1,'LVH',159);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('40302551f7ba7c2579c3',61,'M','ASY',160,0,1,'ST',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('40761c1ab4fa8f2258f3',50,'F','ASY',110,254,0,'LVH',159);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('407a5e8e40996d277161',50,'M','ASY',150,215,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('407becf76558b7e6e66f',57,'M','ASY',140,214,0,'ST',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('408cb5ea3ec8ea5d3d5b',68,'F','NAP',120,211,0,'LVH',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('40abcc582d046f76b4d4',50,'M','ATA',140,216,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('413202ca26bfdd2d2ae5',52,'M','TA',118,186,0,'LVH',190);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4151fe27fba2f79a193f',58,'M','ATA',136,164,0,'ST',99);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('415360aec870d36085de',31,'F','ATA',100,219,0,'ST',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('419f793c8504e5f5c8fc',63,'F','ATA',132,0,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('41a6ceadab2344fd86a0',60,'M','NAP',115,0,1,'Normal',143);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('42dff27f4d56fc0367c0',32,'M','ATA',110,225,0,'Normal',184);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('42efd033ad32bee89603',51,'M','ASY',128,0,0,'Normal',107);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('43664d740a798929a337',37,'M','ASY',120,223,0,'Normal',168);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('438ec18f1c373e6c235c',52,'M','ATA',134,201,0,'Normal',158);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('43b9799253d3234eff18',41,'M','ATA',120,291,0,'ST',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('43cf2d01d209619c39c1',43,'F','TA',100,223,0,'Normal',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('44a6e55ab16675bab669',67,'M','ASY',125,254,1,'Normal',163);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('44ef4919bf7dafbc766d',53,'M','ASY',140,243,0,'Normal',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('456359ed5e3daaa14156',75,'M','ASY',170,203,1,'ST',108);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4600226215f531b54df5',42,'M','NAP',120,228,0,'Normal',152);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('461569527c228c82d4e8',54,'M','ASY',110,206,0,'LVH',108);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('463577207d7b64303ff0',59,'M','ASY',124,160,0,'Normal',117);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('46766df7776ef87fb3a1',43,'F','NAP',150,254,0,'Normal',175);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('46c53b07094e77c1eb2b',57,'M','ASY',150,255,0,'Normal',92);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('46d8810853dfeda0a184',34,'M','TA',118,182,0,'LVH',174);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('46fee7b060395607e09a',56,'M','NAP',125,0,1,'Normal',98);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('471345d5647287e86329',55,'M','ATA',120,256,1,'Normal',137);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4731d3f3a373b6e9b53e',56,'F','ASY',200,288,1,'LVH',133);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('474c441c9fe5d04c2eb3',53,'M','NAP',155,175,1,'ST',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('47b28105fe2735496453',39,'M','ATA',120,204,0,'Normal',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4816e4b24391f9b81957',58,'M','ASY',132,458,1,'Normal',69);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('48429557a6d1255bc477',52,'M','ASY',112,230,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4884208634466b5c047e',54,'M','NAP',120,258,0,'LVH',147);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('48d1b03ba10e42ee9dec',55,'M','ATA',130,262,0,'Normal',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('48d3bca064f9582aaaf6',56,'M','ASY',128,223,0,'ST',119);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('496214e2ff777f050652',68,'M','NAP',134,254,1,'Normal',151);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('496de333fcbcda23299c',63,'M','NAP',130,0,0,'ST',111);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('49c06e66f6e5084aced5',60,'F','TA',150,240,0,'Normal',171);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('49fa4c1aea3a70296504',47,'M','ASY',160,0,0,'Normal',124);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4ac04f2320dfa1f7d49b',62,'M','TA',120,0,1,'LVH',134);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4ade525b59e100ca08fc',35,'M','ATA',120,308,0,'LVH',180);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4b500a6794f9943a2d8d',55,'M','ASY',160,289,0,'LVH',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4b7d899746c5e0ce1116',42,'M','TA',148,244,0,'LVH',178);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4c8382068d4759c47c82',54,'M','ATA',120,238,0,'Normal',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4ca51205bd8e9c184131',55,'M','NAP',120,0,0,'ST',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4ce7a78623e9b5d29578',58,'M','NAP',137,232,0,'ST',124);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4ce9b12e2a2691cac186',37,'F','ASY',130,173,0,'ST',184);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4d64340b4579f870fe8d',39,'M','ASY',110,280,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4da14f016413618694ae',53,'M','ASY',126,0,0,'Normal',106);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4dae3a948fcc68a938b1',49,'M','ATA',100,253,0,'Normal',174);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4dc47bd4166b27c0ba35',62,'M','ASY',152,153,0,'ST',97);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4e357f5932a8281c42f7',40,'F','ASY',150,392,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4f5c521decb4336bb8a0',57,'M','ASY',95,0,1,'Normal',182);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4f7fab846130edadfa4e',56,'F','ASY',134,409,0,'LVH',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4fdd2ff829b2cf545294',65,'M','ASY',160,0,1,'ST',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4fe652d5008ff504b4d4',56,'M','NAP',120,0,0,'Normal',97);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('4ff54558485c44967c1d',54,'F','ATA',130,253,0,'ST',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('50142e8e3e54d4e56dfd',55,'M','ASY',145,248,0,'Normal',96);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('509927ed5ee3076f6c60',42,'M','ATA',120,198,0,'Normal',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('50f7fa0a422c79a233d1',61,'M','ASY',125,292,0,'ST',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('51cb26894de1e949332b',48,'F','ATA',120,177,1,'ST',148);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('51ff009a7c366a54707f',46,'M','NAP',120,230,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('520338d932a5869a578e',47,'M','ASY',140,276,1,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('52941ba31526ca20c714',49,'M','NAP',120,188,0,'Normal',139);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5299f68ccb868a4844ea',55,'M','ATA',110,214,1,'ST',180);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('530cf7fc2afcfbf25e25',46,'M','ASY',100,0,1,'ST',133);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('535380e9738f4fdd8ce5',59,'M','ASY',170,326,0,'LVH',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('53a164364613a6b534bb',45,'F','ATA',180,295,0,'Normal',180);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5465e07af83adc0faa45',47,'M','NAP',140,193,0,'Normal',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('54a1dc6f3b84d42f7529',69,'M','ASY',122,216,1,'LVH',84);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('54c4e7227451f065ca69',63,'M','ASY',140,0,1,'LVH',149);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5501a7942e672c7fc7bd',63,'M','ASY',130,308,0,'Normal',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('551799f28c9e33cbf1e0',48,'M','ASY',140,208,0,'Normal',159);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5546164284624a08202b',43,'M','ASY',140,0,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('55fe30702cbc25fb973b',41,'M','ASY',110,172,0,'LVH',158);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5771442dc7508951812f',39,'M','NAP',160,147,1,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5778d9e0af9a3a0c4226',63,'M','ASY',140,260,0,'ST',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('582b767f304024c44ff8',69,'M','NAP',142,271,0,'LVH',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('584efdf198ce3445f3a7',50,'F','ASY',120,328,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5856bd04fc16eb7f94bb',61,'M','NAP',150,243,1,'Normal',137);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('58cf3870cb28f0b23005',60,'M','ASY',140,281,0,'ST',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('58d72b8304cf3f948508',56,'M','ASY',130,0,0,'LVH',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('58f07b75ccb44bddb82f',57,'M','ASY',144,270,1,'ST',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5926e1821e832365bcff',41,'M','ASY',130,172,0,'ST',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('593fcd44544b7d81ffdc',44,'F','NAP',118,242,0,'Normal',149);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('59746f455ee63fa8e5cd',51,'F','NAP',110,190,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5993d4d33512ec2fe3a5',74,'M','ATA',145,0,1,'ST',123);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('59d5bf866d3c594b24b9',71,'M','NAP',144,221,0,'Normal',108);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('59ea19bd8e073715ff64',68,'M','NAP',150,195,1,'Normal',132);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5a15bda435254712aadc',54,'M','ASY',125,224,0,'Normal',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5aa06461bbc98db2c94c',51,'F','NAP',130,220,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5ab1d01c58821d7a3643',50,'M','ASY',115,0,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5affaedde21c6352ad5b',39,'M','ATA',190,241,0,'Normal',106);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5b29fe49a38b8f88610a',65,'M','ASY',136,248,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5b9d2c8aea513988e54d',62,'F','ASY',140,394,0,'LVH',157);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5da480710137645c5c56',62,'F','ASY',160,164,0,'LVH',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5db4319dbc1caa795db4',51,'M','ASY',95,0,1,'Normal',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5dbb024ee5058e71d06e',62,'F','TA',140,0,1,'Normal',143);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5dcd2e5a891f7269e027',62,'M','NAP',120,220,0,'LVH',86);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5e71044c5ff648704af4',59,'M','ASY',140,177,0,'Normal',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5ee281a390adb914b75c',51,'M','ASY',131,152,1,'LVH',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5f342d1bd580e06426a8',58,'M','ASY',100,213,0,'ST',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5f596c0497a7b080a632',32,'M','TA',95,0,1,'Normal',127);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5f7ac6b2cfe6b08ca71b',59,'M','ASY',140,274,0,'Normal',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5f7dd41d867a2097f6b7',64,'M','NAP',140,335,0,'Normal',158);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5f923cfbeb840d37e586',46,'M','ASY',110,236,0,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('5fdd6bc0c459919fd046',59,'M','ASY',122,233,0,'Normal',117);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('603f3fab4eca6b44e8f3',54,'M','ASY',130,0,0,'ST',117);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('60ff2ae3fc31f6f050a2',56,'M','NAP',130,276,0,'Normal',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6121c157952126cd2e41',51,'M','ASY',140,0,0,'Normal',60);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('613f58bbed9576719095',57,'M','ASY',152,274,0,'Normal',88);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('61a1057a1503d1fec90e',46,'M','ASY',130,222,0,'Normal',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('61b94bff3a8270c96f74',29,'M','ATA',130,204,0,'LVH',202);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('61bc7b6278b160d8f050',55,'M','ASY',140,229,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('61cb81e5aad431643f91',43,'M','ASY',140,288,0,'Normal',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('61e3626c1b01d8ae73d7',54,'M','ASY',136,220,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('61f54abf32d95002ac75',47,'M','NAP',138,257,0,'LVH',156);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('62008da9a15c5e3d463a',56,'M','ASY',150,213,1,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('620d80fe44a0b0b24a4d',61,'M','NAP',120,337,0,'Normal',98);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('621dc196ed5eb5514302',53,'M','ASY',144,300,1,'ST',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('62a992dc616f83f8794b',61,'M','TA',134,234,0,'Normal',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('62cb705c83bfc5ed245f',54,'M','ASY',130,603,1,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('62d23df90907f4e6e5e9',35,'F','ASY',140,167,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('62e71c22189bafa8476f',60,'F','ASY',158,305,0,'LVH',161);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('631964935f468cc31cff',60,'M','ASY',135,0,0,'Normal',63);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('634ef746de8eac0226ba',40,'M','TA',140,199,0,'Normal',178);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('63c3becc3690fcd138bd',57,'M','NAP',128,229,0,'LVH',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('63f80e2f343e6478c936',53,'M','ASY',124,243,0,'Normal',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('645819a2c0a05a1faf52',58,'M','NAP',112,230,0,'LVH',165);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('645bc42975cad43006cd',56,'M','ASY',132,184,0,'LVH',105);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6474071e19e646b3b567',55,'F','ATA',110,344,0,'ST',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('648cca9b2bdb8712ae71',55,'M','ATA',140,0,0,'ST',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('649d6ad91328fa195d6e',76,'M','NAP',104,113,0,'LVH',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('64e770772186914cb247',34,'M','ATA',98,220,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('64faea6a70b2add96a6f',58,'M','ASY',136,203,1,'Normal',123);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('65269b2bfca58fa9dfba',38,'M','NAP',100,0,0,'Normal',179);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('65f23cf0679653265a5d',66,'F','NAP',146,278,0,'LVH',152);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('65ff51134db1d5f7ce05',60,'M','NAP',141,316,1,'ST',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('66c90dba0219640d4dce',66,'M','NAP',120,0,0,'ST',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('66d8948c0e444770ebff',48,'M','ATA',140,238,0,'Normal',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('66d95bd5a85a32e5d9ce',56,'M','NAP',130,256,1,'LVH',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('677d17379b502eb3c206',59,'M','TA',178,270,0,'LVH',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('67da6af3af6535bdd855',53,'F','ASY',138,234,0,'LVH',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('688f83443fd74cdc6776',56,'F','ATA',140,294,0,'LVH',153);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('696ff78d85a2f11ffa20',38,'M','ASY',110,196,0,'Normal',166);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6a3cb8f33304e57effff',70,'M','ATA',156,245,0,'LVH',143);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6a81b6f966cdddfe4f55',62,'M','ATA',120,254,0,'LVH',93);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6b04b330bb23a039ab71',57,'M','ASY',150,276,0,'LVH',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6b20fc1847def027931a',42,'M','ATA',120,196,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6ba8f8989ddf27ed0a30',51,'F','NAP',130,256,0,'LVH',149);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6bdda919653f41244d28',38,'M','ASY',92,117,0,'Normal',134);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6be1170648bd1842d191',63,'M','NAP',133,0,0,'LVH',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6bf7e8f8ebbc5e5d9f4d',38,'M','NAP',145,292,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6c1c069b2ecea71510ae',42,'M','ASY',140,358,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6c20b1e758f3ed9956ce',59,'M','TA',170,288,0,'LVH',159);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6c3a43af1c2e7271a6ed',48,'M','ATA',130,245,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6c511a99eee319aff12b',45,'F','ASY',138,236,0,'LVH',152);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6cc1bfc5b5df1cbc11d0',63,'M','ASY',130,330,1,'LVH',132);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6d54c4fe298d1c441e2f',74,'M','ASY',155,310,0,'Normal',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6d76cc6bf32ebea9e4c3',51,'M','NAP',137,339,0,'Normal',127);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6dc69484a31693314a9f',72,'M','NAP',160,0,0,'LVH',114);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6de4586c2fe6cc927a86',56,'M','ASY',115,0,1,'ST',82);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6e1209bf2a2a74e3b0c7',69,'M','ASY',142,210,1,'ST',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6e556e5fd6cc948c2ce7',58,'M','ASY',115,0,1,'Normal',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6e6ead739b827e06411a',43,'M','ASY',120,175,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6ea2a179430b52b8b58f',51,'M','ATA',130,224,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6eac16fcab54d3bdb202',57,'F','ATA',130,236,0,'LVH',174);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6ebbd31c136e4fc2f1a4',37,'F','NAP',120,215,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6ed0710a57920e6e1eb7',64,'M','ASY',145,212,0,'LVH',132);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6ed70074561a90fdcd73',43,'M','ASY',115,303,0,'Normal',181);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6ef79bf77bb5f62481a6',54,'M','ASY',130,202,1,'Normal',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6f28a5491ca569776cef',52,'M','ATA',120,284,0,'Normal',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6f78813708e43df44f42',48,'M','ASY',124,274,0,'LVH',166);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6f8f1e7bf87a06d2dde7',50,'M','ATA',170,209,0,'ST',116);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('6ff92004b82c0773370c',48,'M','ASY',160,355,0,'Normal',99);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('702ee4221a464e8808c6',49,'M','NAP',140,187,0,'Normal',172);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('705f239a55e7ca4dc225',49,'F','NAP',130,207,0,'ST',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7066ece32eb790f57183',51,'M','NAP',125,245,1,'LVH',166);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('70c617a57c0c7961154f',50,'M','ASY',130,233,0,'Normal',121);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('711b57c91806b7a9409e',57,'M','ASY',139,277,1,'ST',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7129d0be95bf80a3a3e7',52,'M','ASY',160,246,0,'ST',82);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('713d17dc105e219daa4d',58,'M','ATA',126,0,1,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7179ebbec61ecb2a43b6',59,'M','NAP',180,213,0,'Normal',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('71f11dab7f0316ebf6ce',62,'M','NAP',160,0,0,'Normal',72);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('728e4bb9f18c262e1644',64,'F','ASY',95,0,1,'Normal',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('72b8824bbbd99c420f09',65,'M','ASY',135,254,0,'LVH',127);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('72d727ecd1084be4ffe4',42,'M','ASY',136,315,0,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7328d51a6bff705848cc',43,'M','ASY',150,247,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('734b95122aaa925064a0',52,'M','ATA',160,196,0,'Normal',165);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('73e69cd93e24a6155164',44,'M','ATA',120,220,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('741c50597524a9c1836f',35,'M','NAP',123,161,0,'ST',153);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7479caef0c4b6dd4e729',62,'M','ASY',158,170,0,'ST',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('749c02f86f007e999b08',63,'M','NAP',130,0,1,'ST',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('749c40a15c141f432cdf',55,'M','NAP',120,220,0,'LVH',134);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('74d33de80bbf05c8d2b8',58,'M','ASY',128,216,0,'LVH',131);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('754eb10a0eed54bca2f5',67,'M','ASY',160,384,1,'ST',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7568c485ef37e67bab0c',71,'F','ASY',112,149,0,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7599f828f1d75bab5c7f',50,'F','ATA',120,244,0,'Normal',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('75ff9a032d944ecbf661',54,'F','ASY',138,274,0,'Normal',105);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('763534206f32471959c9',44,'M','ATA',130,219,0,'LVH',188);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('76dd41fadab889beff63',46,'M','ASY',118,186,0,'Normal',124);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7749ab0e6d073e87031a',61,'M','ASY',125,0,0,'Normal',105);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7753f66e9674bfb76f7b',51,'M','ASY',110,0,1,'Normal',92);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7788cc104dcc4d40e8bd',61,'F','ASY',130,330,0,'LVH',169);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('779fb8110c0c43ae1edc',62,'F','ASY',124,209,0,'Normal',163);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('77c61affa5cf84ff6aa5',48,'M','ASY',160,193,0,'Normal',102);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('791fc5517f426987555d',56,'M','TA',120,193,0,'LVH',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7941c859d5624ce337c3',59,'M','ASY',135,234,0,'Normal',161);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('794ebf1c3373386c583f',52,'M','ASY',128,255,0,'Normal',161);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7996998147abeb97e85e',54,'M','ATA',160,195,0,'ST',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('79aaf5d6d7d7a8e0fd9f',34,'F','ATA',130,161,0,'Normal',190);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('79d1ae1126f7f7364023',66,'M','ATA',160,246,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('79ee628a131740821e49',44,'M','ASY',120,169,0,'Normal',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('79f3cdee243abd8f1612',58,'M','ATA',130,230,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7a3e4ce31d5096e392c8',53,'M','ASY',124,260,0,'ST',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7a5ba8b2161927bb2bdc',57,'M','ATA',124,261,0,'Normal',141);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7a5e9e05443f63fed646',51,'F','NAP',140,308,0,'LVH',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7ac9fffec258467a3321',42,'M','ASY',105,0,1,'Normal',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7b03a8838b7040594a80',35,'F','ASY',138,183,0,'Normal',182);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7b22fe65d75e06971d54',53,'M','ATA',120,0,0,'Normal',95);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7b375b80de9ad4189b89',58,'M','ASY',146,218,0,'Normal',105);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7b721451942d82a48e62',70,'M','ASY',130,322,0,'LVH',109);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7b8319954d27c2378959',58,'M','ASY',110,198,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7ba6be017689f912acfe',70,'M','ASY',145,174,0,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7bd0c8ea2dbbef043783',60,'M','ASY',145,282,0,'LVH',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7c5f7e7601fbe0285210',61,'M','ASY',134,0,1,'ST',86);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7cc2efc8a04910c522fe',52,'M','ASY',120,182,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7d465c69e36ae343d6ba',54,'F','NAP',110,214,0,'Normal',158);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7d4b45d0eeaa3f32bea6',67,'M','ASY',140,219,0,'ST',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7d57385c9190ed45a480',64,'M','ASY',110,0,1,'Normal',114);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7db8d8d92f3dd870701c',63,'M','ASY',100,0,1,'Normal',109);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7dbe1c32ec89ef96ab50',55,'M','ASY',135,204,1,'ST',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7de4d75a19c03830201f',69,'M','ASY',140,208,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('7de71279b1995429a08b',41,'M','NAP',130,214,0,'LVH',168);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('80306c57afa52a9e802e',45,'M','ASY',115,260,0,'LVH',185);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('80824b3a1af77a842e5f',46,'F','ATA',105,204,0,'Normal',172);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('80a49479fa0a16333070',58,'F','TA',150,283,1,'LVH',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('80c58da1cff4b8e7da73',60,'M','ASY',125,258,0,'LVH',141);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('810c44a9149cdca68b4c',40,'M','NAP',106,240,0,'Normal',80);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('81262085f71c2e6aacd7',48,'F','ASY',120,254,0,'ST',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8138a15b78f9951c9bf2',54,'M','NAP',120,237,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('817641636f8b52c969cd',67,'M','ASY',120,0,1,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('81c68ff0ec07c99ab3ab',44,'M','ATA',120,263,0,'Normal',173);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('81e6f5422d7dba8af646',65,'M','ASY',110,248,0,'LVH',158);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8215e3417c3913f4974c',51,'F','ASY',114,258,1,'LVH',96);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8250c16f0f22a736c564',69,'M','ASY',140,110,1,'Normal',109);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('83241f4adb7f9524363d',36,'M','NAP',112,340,0,'Normal',184);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('837f8ea626775f9b5587',62,'M','NAP',138,204,0,'ST',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('83c56140000f2e0dac62',56,'M','ASY',150,230,0,'ST',124);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('84018718b64ca6422e10',71,'F','ATA',160,302,0,'Normal',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('84272158dde9d3c9885f',63,'M','ASY',170,177,0,'Normal',84);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('843635d41bb8bfd06bd7',45,'M','ASY',142,309,0,'LVH',147);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('846ace31851e97d1cd97',39,'M','NAP',140,321,0,'LVH',182);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('84dd5c73220b45032fa8',57,'M','NAP',150,126,1,'Normal',173);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('851987db65373bc600a3',46,'F','NAP',142,177,0,'LVH',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('855df5f6553d1b816b8d',41,'M','ASY',120,336,0,'Normal',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('857abe972f01728d2a98',47,'F','NAP',130,235,0,'Normal',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('857e848b376432b305bf',68,'M','NAP',180,274,1,'LVH',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('85c2ffa2cfdedfa8a354',50,'F','NAP',140,288,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('85ce9150439fc1382ab4',55,'M','ASY',140,217,0,'Normal',111);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('85ec360fae83cfd754f1',38,'M','ASY',150,0,1,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('863e978c4e15dc39d380',48,'M','ASY',122,275,1,'ST',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('86b13c09d328f951a35f',63,'F','ASY',124,197,0,'Normal',136);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('86c24846680a7dadb821',55,'M','ATA',140,196,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('87305ea49d6845260f76',64,'M','ASY',134,273,0,'Normal',102);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8780b8dc1962dbaa5bd2',45,'F','ATA',130,237,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8856232d5e8998debdba',54,'M','NAP',125,273,0,'LVH',152);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('887a8a0d8d8c89362ed0',51,'M','ASY',128,0,1,'ST',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('88804aac3838e40b6460',62,'F','ASY',120,0,1,'ST',123);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('889e1a111b034e7849df',38,'F','ASY',105,0,1,'Normal',166);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8952f3ba1a47e88322c7',69,'M','ASY',145,289,1,'ST',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8954edafcd7627a9ab03',59,'F','ASY',130,338,1,'ST',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8958dbafef1c0bbbe644',37,'M','NAP',130,194,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8a0dbfd1abe2df64b0e9',73,'F','NAP',160,0,0,'ST',121);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8a49ee5f7af303a2ec3f',54,'M','ATA',120,246,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8a4b332a9ee51025d0f2',65,'M','ASY',120,177,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8a4cc0ef600b61af5e60',46,'M','ASY',110,240,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8a72f3425624ae8dc676',51,'M','ASY',130,179,0,'Normal',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8a8226814a48634439e7',46,'M','ATA',140,275,0,'Normal',165);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8acb9d5a7bd6cd9870d8',54,'M','ASY',140,239,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8adfb7329c1f569198c0',54,'M','ASY',120,0,0,'Normal',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8af1b78177973d6e35bc',53,'M','NAP',145,518,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8af822f17a94c9d7ad1e',53,'M','ASY',180,285,0,'ST',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8b03a038e6b092ed8f4c',55,'M','NAP',136,228,0,'ST',124);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8b0cb67d76db27074a07',41,'F','ATA',110,250,0,'ST',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8b2430e5a1088953ddcc',60,'M','ASY',125,0,1,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8b796495c819abc74b61',37,'M','NAP',130,250,0,'Normal',187);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8bbca7a2d165969a38cd',52,'M','ASY',125,212,0,'Normal',168);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8c0509972c011dd49ee0',61,'M','ASY',150,0,0,'Normal',105);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8c5069969082502a62d3',55,'M','NAP',136,245,1,'ST',131);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8cd42970313adb57ad5c',37,'M','NAP',118,240,0,'LVH',165);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8cd5d5998de68d024f38',36,'M','ATA',120,166,0,'Normal',180);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8d2e8289a1690fb768f6',65,'F','ASY',150,225,0,'LVH',114);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8d463f90297afb61fe10',38,'M','NAP',138,175,0,'Normal',173);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8d9ebe00b9970f55e076',48,'M','NAP',110,211,0,'Normal',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8da885ed8065dcd79398',54,'M','ASY',124,266,0,'LVH',109);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8ddf9c717b28affb353f',34,'F','ATA',118,210,0,'Normal',192);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8e1a29b9c14b458ea389',68,'M','NAP',118,277,0,'Normal',151);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8efef0f3f8e4f21e4e71',70,'M','ASY',140,0,1,'Normal',157);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8eff49b0cf5f1bf06753',51,'M','ASY',140,261,0,'LVH',186);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8f84475508656a13c06d',65,'M','ASY',150,236,1,'ST',105);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8f93abac9df233bda1d5',48,'M','ASY',115,0,1,'Normal',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8fa99fb86c75b13480b1',43,'M','ASY',132,247,1,'LVH',143);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8fc783a9bafef91b5abf',59,'M','NAP',125,0,1,'Normal',175);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('8fd348af0102a25768a5',52,'F','NAP',125,272,0,'Normal',139);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('902b0ba9dc9dc7555fac',49,'M','TA',130,0,0,'ST',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('909e120b65d69257df33',46,'M','ASY',115,0,0,'Normal',113);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9193e48c4ad363d203c1',45,'M','TA',110,264,0,'Normal',132);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9220f1809933bf22ac21',53,'M','ASY',142,226,0,'LVH',111);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('923a7e16a4d859799f11',64,'M','ASY',150,193,0,'ST',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('92b8882414b68f4d1f88',54,'M','TA',120,171,0,'Normal',137);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('93159f552e3c649ca9dd',50,'M','ASY',140,129,0,'Normal',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('936504f5fbee30a5e7d2',41,'F','ATA',130,204,0,'LVH',172);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('93855f95a36b9e668442',64,'M','ASY',128,263,0,'Normal',105);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('93907c3a0ca099cffd2f',34,'M','ASY',115,0,1,'Normal',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('93946a01993f85407d17',67,'M','ASY',146,369,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('93fb325bfe9c0b30cf43',61,'M','ASY',105,0,1,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('941e81ecb8041aea10e3',56,'M','ASY',120,0,0,'ST',148);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9471b7a223ecbaa9eaa7',63,'M','ASY',185,0,0,'Normal',98);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('948ac09d794ed3ecd9ab',55,'M','NAP',110,277,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('949a7eebb06e3d7633a0',49,'M','ASY',150,222,0,'Normal',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('94f56fd3acd705f0625a',46,'M','ASY',110,238,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('952a6b384b74672d95fb',34,'M','TA',140,156,0,'Normal',180);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9542899d35ff7086dcc9',64,'M','ASY',130,223,0,'ST',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9544882c5181c751bf48',58,'M','ASY',135,222,0,'Normal',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9571875015abf7061afb',66,'M','ASY',140,139,0,'Normal',94);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9586f3d659306edbbdc4',63,'M','ASY',126,0,0,'ST',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9588a1cd843cb70dead1',55,'M','ASY',120,270,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9659ca981811785d1eae',63,'M','ASY',96,305,0,'ST',121);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('96f83bda76860efe6133',54,'M','ASY',122,286,0,'LVH',116);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('970490ef41b2a070a72c',48,'F','ASY',138,214,0,'Normal',108);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('971a4d47570b9fbf75e1',43,'M','ASY',120,177,0,'LVH',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9733264811b326b07421',49,'M','ASY',130,206,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9762e58320b5bcb733d3',66,'M','ASY',112,261,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('97af929407f2b3817943',60,'M','ASY',152,0,0,'ST',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('97d60bd0959f7b14072b',55,'M','TA',140,295,0,'Normal',136);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('97e8cc17ededa8bf563d',67,'M','ASY',120,237,0,'Normal',71);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('97eee2a2a37a7075b0bf',40,'M','ATA',140,289,0,'Normal',172);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('982780715b51277b3b7f',70,'M','NAP',160,269,0,'Normal',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9848a15c2a5764f852f0',51,'M','ASY',140,298,0,'Normal',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('98558664c9b12ac1fb71',63,'M','ASY',136,0,0,'Normal',84);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9857a8cc9d0ce9b11af3',41,'M','ASY',104,0,0,'ST',111);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('98966ba6058cb5773967',64,'M','ASY',120,246,0,'LVH',96);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('98c4d351b3c49e102754',51,'M','NAP',135,160,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('990b87952b0786a895f1',55,'M','ASY',142,228,0,'ST',149);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('99307b05d52059652a03',43,'F','ATA',120,215,0,'ST',175);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9979bfd32e4f4dc0d3a9',52,'M','ASY',112,342,0,'ST',96);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9987bbae55fc81a124c5',41,'M','ASY',150,171,0,'Normal',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('99af713b9a23e335d371',47,'M','ASY',150,226,0,'Normal',98);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('99f5fa8f6c8ab74d1ffb',49,'M','ASY',140,185,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9a0552038cc6a2ae1416',59,'M','TA',134,204,0,'Normal',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9a0abc4d63b8c5d11e35',48,'M','ASY',130,256,1,'LVH',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9a4f6e2cf51f5b733be9',59,'M','NAP',126,218,1,'Normal',134);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9af1d8a460aeb536f1d1',67,'M','TA',145,0,0,'LVH',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9c486e72038d2c7fc500',51,'F','ATA',160,194,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9cb7e06126b9fa119ae3',58,'F','ASY',130,197,0,'Normal',131);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9cc248bb00efa9bbc101',42,'M','NAP',130,180,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9cfc918593ce722591e4',51,'M','ATA',125,188,0,'Normal',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9dccd95a40086739f631',41,'F','ATA',125,184,0,'Normal',180);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9e5e5348d2c9e4e210f9',44,'M','NAP',130,233,0,'Normal',179);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9e67077719ea86a0de0f',61,'M','ASY',146,241,0,'Normal',148);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9e8bcb0ef98303e051c3',44,'M','ASY',135,491,0,'Normal',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9eada5265c3e77ff4c1d',57,'F','ASY',120,354,0,'Normal',163);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9ecb363c3c9a6ac56c6c',62,'M','ATA',131,0,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9ecedec61d2d1fa1dcbb',60,'M','NAP',140,185,0,'LVH',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9eee1a9659889a63a9ad',60,'M','NAP',180,0,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('9f53dabc018ddd75db88',42,'F','ASY',102,265,0,'LVH',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a03f473fa2f83d9721e0',60,'F','NAP',120,178,1,'Normal',96);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a04ce3bd691deda1d068',44,'M','ASY',112,290,0,'LVH',153);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a04ebb854aa2cb74cbdb',55,'M','ASY',115,0,1,'Normal',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a08c9a11799bb1932606',60,'M','ASY',130,0,1,'ST',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a09c0024311441fe1f16',43,'F','ASY',132,341,1,'LVH',136);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a100493b836755314fe2',54,'M','ASY',150,365,0,'ST',134);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a10cf000b81b55895b61',41,'M','ATA',120,295,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a1bd40a9f2b95a49c307',64,'F','ASY',200,0,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a1d62eda8f40de89d835',59,'M','ASY',140,264,1,'LVH',119);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a255181870b54fbc11ac',54,'M','ASY',125,216,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a268a8d42f0d183b1cd8',54,'F','ASY',127,333,1,'ST',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a290b7aa7c7e51571187',57,'M','ASY',140,0,1,'Normal',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a3331d3fa3e03bb2538e',69,'M','ASY',135,0,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a394c755da3212da6e2b',50,'F','ASY',160,0,1,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a3e9ba930a7c4a8b28b3',47,'M','ATA',160,263,0,'Normal',174);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a456037768b0aeb1cfb4',48,'F','ASY',108,163,0,'Normal',175);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a4b783969d0afe9b09f3',62,'M','ASY',135,297,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a5726af25af628b66a8e',60,'M','ASY',130,253,0,'Normal',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a5b6bbfee19f48afa007',54,'M','NAP',120,217,0,'Normal',137);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a5f69b20b65ce0f0ba06',59,'M','TA',160,273,0,'LVH',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a61f30ef4bcdf428c6f3',62,'M','ASY',160,254,1,'ST',108);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a66b1265b5b111d5159b',41,'M','NAP',112,250,0,'Normal',179);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a693bd7548e1e2b5fc6c',53,'M','ATA',130,0,0,'ST',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a6c635c6df0ffadd3816',61,'M','ASY',190,287,1,'LVH',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a6e4e6913d43f224f7e3',61,'F','ASY',145,307,0,'LVH',146);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a7219f63d9902c3d2213',58,'M','ASY',140,385,1,'LVH',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a7959864cc69db94898a',62,'F','ASY',150,244,0,'Normal',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a7a203b73a759dd062a8',51,'F','ASY',160,303,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a89bc5f911ded4a6bcd7',45,'F','ATA',130,234,0,'LVH',175);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a8d9790143f25d2fc86c',68,'M','TA',139,181,1,'ST',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a8f4a38cfa4a27b20ff3',54,'M','ASY',140,216,0,'Normal',105);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a94651429008fca5f6a3',31,'M','ASY',120,270,0,'Normal',153);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('a9fb85b7aa7e63196c23',58,'F','ASY',100,248,0,'LVH',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('aa47a114faff2029d952',50,'F','ATA',110,202,0,'Normal',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ab6d7cc8a6413418af66',64,'M','ASY',130,258,1,'LVH',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ab79a0258648cbbb9d3e',54,'F','ATA',140,309,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ac19e15b005f3f3e0b09',39,'M','ASY',110,273,0,'Normal',132);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ac40734abc6e4b7d8342',48,'F','NAP',120,195,0,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('acc49d9c7de6e82fe473',58,'F','ASY',170,225,1,'LVH',146);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ad7fe3ddb5cf981cb86a',50,'M','ASY',140,231,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ad825ecc095f61379eda',69,'M','ASY',130,0,1,'ST',129);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ae4af76ca8f02746f45b',60,'M','ATA',160,267,1,'ST',157);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ae9930e73ef51a18b2e4',51,'M','ASY',120,0,1,'Normal',104);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('aea3590d6124c94e1658',67,'F','NAP',115,564,0,'LVH',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('aeb709d7bb57e5eda213',50,'M','ASY',140,341,0,'ST',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('af6aaed45d567230dc01',59,'M','ATA',140,287,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('afa16017c9431851df1c',49,'F','ATA',124,201,0,'Normal',164);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('afaeadc39747db401021',53,'M','ASY',120,0,1,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('afce08abcdd167c4ea36',63,'F','NAP',135,252,0,'LVH',172);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b037e7bb8c87e6720994',42,'M','ASY',140,226,0,'Normal',178);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b069c60123c2edb8b968',52,'M','ASY',140,404,0,'Normal',124);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b07b2ca45c3f552ffb0e',62,'M','ASY',120,267,0,'Normal',99);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b104b36dba7de175a591',57,'F','TA',130,308,0,'Normal',98);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b13532d9285dcb231632',44,'F','ASY',120,218,0,'ST',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b165f69cf1bd157682a2',55,'F','ATA',132,342,0,'Normal',166);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b189de7a16e5cec9af5f',40,'M','ASY',95,0,1,'ST',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b1963f7aff9d19f3c67e',35,'M','ASY',120,0,1,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b1f1b0658a24899862b7',69,'M','TA',160,234,1,'LVH',131);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b2272e1b7abcdb9770d0',53,'M','ASY',130,0,0,'LVH',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b234043a2a6fc3158cf1',52,'M','ASY',130,0,1,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b275d9fc7a8c30c78de7',66,'M','ASY',150,0,0,'Normal',108);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b2b74a2fc2d6d7e4ccf6',66,'M','NAP',110,213,1,'LVH',99);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b2ca761ec994d723d65c',64,'F','NAP',140,313,0,'Normal',133);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b2f5992c7451b2737d24',48,'M','ATA',110,229,0,'Normal',168);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b37ca4d4b5a96db3d512',38,'M','ATA',140,297,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b3a4f7e64ce3e80f6579',55,'F','ASY',180,327,0,'ST',117);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b3aa363d1b7f02fc2a07',66,'M','ASY',112,212,0,'LVH',132);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b40f9a278bc7627cc9d1',35,'M','ASY',120,198,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b4967282b915bc7e8cfe',66,'F','ASY',155,0,1,'Normal',90);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b49d1180d02700272302',60,'F','NAP',102,318,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b4d91514d327dee349d7',54,'M','ASY',180,0,1,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b50ee0febb919c44f3f4',44,'M','ATA',130,215,0,'Normal',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b56a14d6492d69c2202e',41,'F','ATA',130,245,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b571d3764f616405760a',44,'M','ATA',120,184,0,'Normal',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b5724232adbcd76c5036',49,'F','ASY',130,269,0,'Normal',163);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b57d6a6cbb9bcb61f822',48,'M','ASY',106,263,1,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b5e5c0e313c9d72355c1',51,'M','TA',125,213,0,'LVH',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b605d3640d7d61372277',54,'M','NAP',150,232,0,'LVH',165);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b639d49358b9232ee67f',56,'M','ASY',130,203,1,'Normal',98);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b63a75be2b25a3f0814a',67,'M','ASY',100,299,0,'LVH',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b674bd761c16dc804445',59,'M','ASY',125,0,1,'Normal',119);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b67592c5ac3be41852e2',77,'M','ASY',124,171,0,'ST',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b6bf46d795338f005f2e',63,'M','ASY',140,187,0,'LVH',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b6cfa0928f16ca6021cf',53,'M','ASY',123,282,0,'Normal',95);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b74487726ee875f0428a',60,'M','ASY',140,293,0,'LVH',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b761cd0a9fbb2131472b',48,'F','NAP',130,275,0,'Normal',139);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b7ab6f450b597e3a9ddb',47,'M','ASY',112,204,0,'Normal',143);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b7c861c23a7779e623f6',54,'F','ATA',150,230,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b8012e068247c8c34c5d',60,'M','ASY',142,216,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b86805cd33d296d4304a',46,'M','NAP',150,231,0,'Normal',147);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b8d843e7a36db27f36c1',39,'M','NAP',120,339,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b91ade4f3003e0b8c562',38,'M','TA',120,231,0,'Normal',182);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('b9d63e9539c47db691e7',39,'F','NAP',110,182,0,'ST',180);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ba1efe225bc9f3ce699e',36,'M','NAP',150,160,0,'Normal',172);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ba3945111a67f42fa6cf',65,'F','NAP',140,417,1,'LVH',157);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ba908396787fb1dfb550',57,'M','ATA',154,232,0,'LVH',164);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ba97de7ddbba8fcde340',56,'M','NAP',170,0,0,'LVH',123);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('bb27d55e5eaafac2dc15',54,'F','ATA',160,312,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('bb725aaac3b41040e8c4',55,'M','ASY',140,0,0,'Normal',83);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('bc44829591394d6bca69',53,'M','ASY',80,0,0,'Normal',141);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('bcc7a01da3f6644a541f',68,'M','ASY',145,0,1,'Normal',136);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('bcce1d02c59d8a8e257e',54,'M','ASY',140,166,0,'Normal',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('bcf6da56f37d5c37edbb',50,'M','ATA',120,168,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('bd23fa4e41ee4acf4a8e',58,'M','ATA',125,220,0,'Normal',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('bec66112ff506980e8ae',42,'M','NAP',120,240,1,'Normal',194);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c0021b7c523930a28220',62,'M','NAP',133,0,1,'ST',119);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c022b909e5d32d9724d0',74,'M','TA',145,216,1,'Normal',116);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c05220bec00cf1c441a3',39,'F','NAP',138,220,0,'Normal',152);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c06c3728b9817df143eb',68,'M','ASY',135,0,0,'ST',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c0a242e1aea08bf0e578',47,'M','NAP',155,0,0,'Normal',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c12eff33e720df4a2150',51,'M','ASY',140,299,0,'Normal',173);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c16d94f4603804968135',45,'M','ASY',140,224,0,'Normal',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c1fddd2bb0bb00604dc9',53,'M','ASY',130,182,0,'Normal',148);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c247ca59acac51c21e0f',58,'M','ASY',130,263,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c2541f8e31893820f436',62,'M','ASY',158,210,1,'Normal',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c2773bc61640bdd6d641',49,'F','ATA',110,208,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c277e63535998f5140cf',32,'F','ATA',105,198,0,'Normal',165);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c2901db0a4b115f731b2',63,'M','ASY',130,254,0,'LVH',147);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c2c09151ca50034dd4c1',54,'M','ASY',110,239,0,'Normal',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c2e5e3ed4c0d107f2daf',58,'M','ASY',100,234,0,'Normal',156);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c2fb81aa6f80eac6ac9f',62,'M','ASY',139,170,0,'ST',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c378123f4db714267034',63,'M','ATA',139,217,1,'ST',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c3cdc462bd68a9bbdc71',45,'M','ATA',140,224,1,'Normal',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c3d02f8a4b3dd0899dfb',52,'M','TA',152,298,1,'Normal',178);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c44767e4179dc1d571ca',56,'M','NAP',155,0,0,'ST',99);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c4640482486a239966fe',58,'M','NAP',105,240,0,'LVH',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c51b33ab48daf3227a7f',43,'F','ATA',120,266,0,'Normal',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c52196c899f37c325461',52,'M','ASY',108,233,1,'Normal',147);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c52f84ba4388e944b7b2',54,'F','NAP',108,267,0,'LVH',167);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c553e2f73b780c5201c8',54,'F','NAP',160,201,0,'Normal',163);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c57e2947cf8d57a4c43c',32,'M','ASY',118,529,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c5e591e8d5f800c6aa39',43,'M','TA',120,291,0,'ST',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c60f2d8974011428f9f7',62,'F','ASY',138,294,1,'Normal',106);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c6454b1dd89911c82dd1',48,'F','ATA',120,284,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c69b0d5916408d15c5f4',60,'M','ASY',132,218,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c6b0c30c6e4d19c6df1c',58,'M','ASY',130,0,0,'ST',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c6bd1719a17dd8bb2c6a',52,'M','ASY',140,266,0,'Normal',134);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c6e2281e8081e324d582',52,'M','ATA',128,205,1,'Normal',184);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c7279410645c62009691',41,'M','ATA',120,157,0,'Normal',182);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c7bca8c3a49e59e38b37',54,'M','ASY',200,198,0,'Normal',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c7c7313d14192876f570',69,'M','NAP',140,0,1,'ST',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c7cf644ab0bc2273d4c8',57,'M','ASY',130,131,0,'Normal',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c7f21625dd930d71d7c0',48,'M','NAP',132,220,1,'ST',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c80081bc37851d8976f5',43,'M','NAP',130,315,0,'Normal',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c83e6a99a5ecda2b14ed',53,'M','ASY',140,203,1,'LVH',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c8875bb7aa4973b17e32',64,'M','ASY',120,0,1,'ST',106);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c8d5f38ea49679f95d3c',63,'M','ATA',136,165,0,'ST',133);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c97bbe78ab43e5b46260',58,'M','NAP',130,213,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c9973bc22051c2b5a258',59,'M','ASY',110,0,1,'Normal',94);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c9e1c888fd882c60ed8d',46,'M','ASY',134,310,0,'Normal',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('c9e3a75b101d9ef47915',60,'M','ASY',160,0,0,'ST',99);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ca17a6264f3e18b7e795',65,'M','ASY',130,275,0,'ST',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cafafbad11c37b59658a',38,'M','ASY',135,0,1,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cb4e1c2818ad5f50f761',64,'M','ASY',141,244,1,'ST',116);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cb65a36d8fa3c1a950cc',47,'M','NAP',108,243,0,'Normal',152);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cc17b4e3205e2c225296',39,'M','ATA',120,241,0,'ST',146);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cc32f70fdae371873b9c',47,'M','ASY',160,291,0,'ST',158);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cc35fd06f8fcfe23acbe',59,'M','ATA',140,221,0,'Normal',164);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cd1a6fb927f8f31b8563',64,'M','ASY',144,0,0,'ST',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cd49724e71edbb720a51',35,'M','ATA',150,264,0,'Normal',168);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cd78826fd4d779d88347',49,'M','NAP',131,142,0,'Normal',127);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cd7a8511721c4cc0428f',52,'F','NAP',136,196,0,'LVH',169);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cd9454c6f5b527cedfb1',49,'M','ASY',128,212,0,'Normal',96);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cdaf0a9a7b6ec37ca4ae',48,'M','ATA',130,245,0,'LVH',180);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ce0a4a92fb02af6c1d8c',37,'M','ASY',130,315,0,'Normal',158);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ce405c066b57d35b4f52',52,'M','ATA',120,325,0,'Normal',172);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ce8e8c616fea827e3398',61,'M','ASY',150,0,0,'Normal',117);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ce99e36a6db54d2eb52f',64,'M','ASY',143,306,1,'ST',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cea7046f0990109db078',65,'M','ASY',145,0,1,'ST',67);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ced5aaca78765205999d',66,'F','ASY',178,228,1,'Normal',165);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cf297a3ee5c2222abb9e',43,'F','ATA',150,186,0,'Normal',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('cf93bb51596a20946332',60,'M','ASY',100,248,0,'Normal',125);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d011cca0fe4204d1155e',55,'F','ASY',128,205,0,'ST',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d026e595b37eadf67a5e',56,'M','ATA',130,184,0,'Normal',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d04672cc1ac239543404',60,'M','ASY',160,0,1,'Normal',149);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d06561190cc09921537c',54,'F','ATA',120,221,0,'Normal',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d06d7e1d41eb09d7e40b',58,'M','ASY',114,318,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d0a35f709b2e7534aaca',41,'M','ASY',125,0,1,'Normal',176);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d143b4bd56d3bce7114c',62,'M','NAP',130,231,0,'Normal',146);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d1a21e48644308f03fac',53,'M','NAP',120,195,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d2915fe5d2ef1a3ad8d3',61,'M','ASY',130,0,1,'Normal',77);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d3056593ecfc00e1787b',65,'M','ASY',170,263,1,'Normal',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d3173363fe7ce8fd665b',40,'M','NAP',140,235,0,'Normal',188);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d37aa773624862c32f9e',29,'M','ATA',120,243,0,'Normal',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d3ad60832b0628a0332b',49,'M','ATA',130,266,0,'Normal',171);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d3f7e35b4973f1758407',39,'M','ASY',130,307,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d414a92b52c7bec9c2fe',57,'M','ASY',130,207,0,'ST',96);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d49ba9983358750c9fbc',62,'F','NAP',130,263,0,'Normal',97);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d4d64933ba47ccc68e1f',52,'M','ASY',128,204,1,'Normal',156);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d4f1e6bbd4f413b44149',44,'M','ASY',130,290,0,'Normal',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d54df4bc3fc70288e985',37,'M','ASY',140,207,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d619cfbdacdbe7d14c85',51,'F','ASY',120,0,1,'Normal',127);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d65b5abd1338c90cb693',61,'M','NAP',120,0,0,'Normal',80);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d666b268657fc650b080',39,'F','NAP',94,199,0,'Normal',179);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d72c38d06868a1d2af82',37,'M','ATA',130,283,0,'ST',98);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d767fa4e13be2a53a7e5',57,'M','ASY',110,201,0,'Normal',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d79717af0595636d8265',43,'F','ATA',120,249,0,'ST',176);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d862bc5f1d8195863d11',64,'M','TA',170,227,0,'LVH',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d8f9464ab63d109848eb',62,'F','ASY',140,268,0,'LVH',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('d96f0dbb7de32f841b8f',61,'F','ASY',130,294,0,'ST',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('dc78474de68634e46db4',48,'F','ATA',133,308,0,'ST',156);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('dc840a490bad9d13e794',53,'F','ASY',130,264,0,'LVH',143);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('dcb4e63b37427b83d5b9',67,'M','NAP',152,212,0,'LVH',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('dd86b13a9cb9da8cb0b3',51,'M','ASY',132,218,1,'LVH',139);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('dddc01b2b648e6d079ad',56,'M','NAP',130,167,0,'Normal',114);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ded1419535ad9dfff1bc',57,'M','ATA',180,285,1,'ST',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('df69c9eb45e8d9e4fd1b',62,'M','ASY',110,0,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('dfca078bd26a9a87e633',59,'M','NAP',131,0,0,'Normal',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e02a2e51aa3591c8b821',32,'M','ATA',125,254,0,'Normal',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e03c52d59b2be7e8ac18',44,'M','NAP',140,235,0,'LVH',180);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e04fe93c044147be1ec2',56,'M','ATA',126,166,0,'ST',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e093b7cfcdefa2b0b894',53,'M','NAP',105,0,0,'Normal',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e0d376b447cd987a96e3',64,'F','ASY',180,325,0,'Normal',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e10bb6acf1ad9ed29579',54,'F','NAP',130,294,0,'ST',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e127982a0b2abe23a756',60,'M','NAP',120,0,1,'Normal',141);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e1b763580797c8f1d7df',55,'M','ASY',158,217,0,'Normal',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e1c3a96d29ab2470b06d',42,'M','ATA',120,295,0,'Normal',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e1c7dd0ef35b589b2691',52,'M','ASY',95,0,1,'Normal',82);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e21b1cf66d867de80828',60,'M','NAP',120,246,0,'LVH',135);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e270fd45fc5f16bfb653',45,'F','ASY',132,297,0,'Normal',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e27a3fabd7399b5ec9ce',58,'M','NAP',160,211,1,'ST',92);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e2ba71b84725e77407ce',55,'M','ASY',140,201,0,'Normal',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e2ed28c2de4a071412a0',50,'M','ASY',145,264,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e35cf40b39314cd7747d',49,'F','ATA',134,271,0,'Normal',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e434f197c69118c50a96',47,'M','ASY',110,0,1,'ST',149);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e443321db9cab7b7f67c',70,'M','ASY',170,192,0,'ST',129);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e47b00081b4415e9ebfc',65,'M','ASY',134,0,0,'Normal',112);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e4a6cd8c8c0984ec0657',58,'M','ASY',150,270,0,'LVH',111);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e4af61754aa4e3667542',42,'M','ASY',145,0,0,'Normal',99);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e4b01f616560dedc7abc',59,'M','ASY',138,271,0,'LVH',182);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e50d98ab8f192c6d1520',61,'M','NAP',200,0,1,'ST',70);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e52c429d025c28a14a01',55,'M','ATA',145,326,0,'Normal',155);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e5ae6140315c2197efe7',48,'M','NAP',102,0,1,'ST',110);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e5dfe5d5b23e5e2be8df',42,'F','NAP',115,211,0,'ST',137);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e5e97e8b867eb2bd7fd2',54,'M','NAP',133,203,0,'ST',137);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e5fa670e12476b1699ea',62,'M','ASY',120,220,0,'ST',86);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e601616d022ae9522232',53,'F','ATA',113,468,0,'Normal',127);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e6280f375964bffa06aa',55,'M','ASY',120,226,0,'LVH',127);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e637661a1b15e5954a6c',38,'M','NAP',115,0,0,'Normal',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e70ccabd3dba712a9cbb',57,'M','ASY',140,192,0,'Normal',148);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e7b90003df78d8890f4c',66,'M','ASY',160,228,0,'LVH',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e7c1facc3ac4380b2086',48,'M','ASY',132,272,0,'ST',139);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e847d257d98437c41eda',64,'M','NAP',125,309,0,'Normal',131);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e89867c4eab43e0c1ff0',57,'M','ASY',110,335,0,'Normal',143);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e8ce51d051e221a03bec',52,'M','NAP',172,199,1,'Normal',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e8e9d0520e88d37fc342',51,'M','NAP',110,175,0,'Normal',123);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e95402913472adf95459',55,'M','NAP',133,185,0,'ST',136);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e9590b7be9a3c23bfffe',61,'F','ATA',140,298,1,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e99e1a4697740a4f33fa',57,'M','NAP',105,0,1,'Normal',148);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('e9e7b144132199c3f716',64,'F','ASY',130,303,0,'Normal',122);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ea3238a7f6a7b34f74e6',63,'M','ASY',150,223,0,'Normal',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('eab2e983c3987903a621',43,'M','ASY',150,247,0,'Normal',171);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('eb0e0122e59aac3750d1',41,'M','ASY',112,250,0,'Normal',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('eb305bd5ad7a99a557b2',62,'M','TA',112,258,0,'ST',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('eb7440b1c6855345d3c9',57,'M','ASY',128,0,1,'ST',148);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('eb7dfc417773c71ef83f',50,'M','NAP',140,233,0,'Normal',163);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('eb807ff0b4fe84188d92',62,'M','ATA',140,271,0,'Normal',152);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ebb8caba64b8ec3d52de',44,'M','ASY',150,412,0,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ebf72a7f8af4b239719a',56,'M','ASY',120,100,0,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ec3cd28364c5a3937e98',76,'F','NAP',140,197,0,'ST',116);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('eccbd251aeeee19ca29e',52,'M','ASY',160,331,0,'Normal',94);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ecd8355872459995b79f',74,'F','ATA',120,269,0,'LVH',121);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ecf75e1e7f1c5236d843',61,'M','ASY',148,203,0,'Normal',161);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ed0dbed1deb70ca393f2',58,'M','NAP',140,211,1,'LVH',165);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ed3c4144287c6253b753',56,'M','ASY',125,249,1,'LVH',144);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ede27b0b37cc04b1cecb',54,'F','ATA',120,273,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ee63aef3cbece762a4e6',52,'M','NAP',128,0,0,'ST',180);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('eeaff1fd2aa7486035db',46,'M','NAP',150,163,0,'Normal',116);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ef63561f760d24450eb3',49,'M','NAP',115,265,0,'Normal',175);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f0187eb04f0c90aabdbd',57,'M','ASY',130,311,1,'ST',148);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f045dcc8bb2c1a26a131',50,'M','ASY',150,243,0,'LVH',128);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f048ba2fd3d8512e78b7',47,'M','NAP',110,0,1,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f057f357cce736a20c30',51,'F','NAP',120,295,0,'LVH',157);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f0aec99be41f1086f920',35,'M','ASY',126,282,0,'LVH',156);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f10fb762b0cde633f999',74,'M','NAP',140,237,1,'Normal',94);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f1c6efcd944e6c342086',52,'M','NAP',140,259,0,'ST',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f1ccef066c1b3208264b',40,'M','ASY',110,167,0,'LVH',114);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f2175e2d6379df0eb9c2',60,'M','ASY',130,206,0,'LVH',132);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f26e72ecc000b883902b',53,'M','ATA',140,320,0,'Normal',162);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f2b0f4f214f32d387088',50,'F','NAP',120,219,0,'Normal',158);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f31fdf20288785eaf76f',69,'M','ASY',137,0,0,'ST',104);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f37b452ee63e7768476e',62,'F','TA',160,193,0,'Normal',116);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f3c4b7bf12a50030340e',54,'M','ATA',108,309,0,'Normal',156);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f3cb0de59bc2187fc55c',67,'M','ASY',160,286,0,'LVH',108);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f3f852e3dfac8d992821',41,'F','ATA',126,306,0,'Normal',163);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f455c091446f4a896d22',43,'F','ATA',120,201,0,'Normal',165);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f4bb0014603d7885dc90',59,'M','ASY',140,169,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f4dd2b6289d9ca72299b',54,'M','ASY',120,188,0,'Normal',113);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f4eb6fec3e7060ace016',43,'M','ASY',115,0,0,'Normal',145);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f4ef5c32c90130a8c89a',56,'M','ASY',140,0,1,'Normal',121);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f4f8e071ec7a25ae387c',54,'M','ATA',110,208,0,'Normal',142);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f5369996a3394f089b9d',51,'M','NAP',94,227,0,'Normal',154);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f5674e8610c34e60db7e',49,'M','ASY',120,297,0,'Normal',132);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f597905831fd5328b831',51,'M','ASY',130,0,1,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f5e9e19813cc2e2f8101',50,'M','ASY',145,0,1,'Normal',139);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f5f223195078cda68156',53,'M','ASY',125,0,1,'Normal',120);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f6579542b2b89337a4a9',57,'M','ATA',140,260,1,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f66cc7245968b773a934',58,'F','NAP',120,340,0,'Normal',172);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f6810d50c14eb77bc7a7',48,'M','ASY',122,222,0,'LVH',186);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f681570296d45cc2631e',58,'M','NAP',150,219,0,'ST',118);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f705eb9f27a12dca7723',61,'M','NAP',140,284,0,'Normal',123);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f73fcd93cfd3fc92f7ed',46,'M','ASY',120,231,0,'Normal',115);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f7ccc63b371cfb6c9852',57,'F','ASY',128,303,0,'LVH',159);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f905256beb7d7861a3d6',71,'F','NAP',110,265,1,'LVH',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f95e0e926a0a836afc6e',63,'M','ASY',160,230,1,'Normal',105);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f98438b9fa6403ae78ad',58,'M','NAP',132,224,0,'LVH',173);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('f9f7ea2db3843fb6018c',44,'F','NAP',108,141,0,'Normal',175);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fa548bd3dc821697e60a',47,'F','NAP',135,248,1,'Normal',170);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fab250a5015cb4028345',58,'M','ASY',160,256,1,'LVH',113);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fb6fa9ef7558c2bf3ac5',57,'M','ASY',110,197,0,'LVH',100);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fb8b118ac7c54dfb89cc',46,'M','ATA',101,197,1,'Normal',156);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fc47e793b17c83e7491e',56,'F','ATA',120,279,0,'Normal',150);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fc790f8b8d7b7b0c5d81',35,'M','ATA',110,257,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fc7ca08b9abb99d8afa4',74,'M','ASY',150,258,1,'ST',130);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fcab7c548a3b8b7a3a76',59,'M','ASY',140,0,0,'ST',117);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fccd9b2902ee7fbcae3d',41,'F','NAP',112,268,0,'LVH',172);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fcdbe9c748fd21cfb670',50,'M','ASY',120,0,0,'ST',156);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fd5ca37a4b3fad528053',74,'M','NAP',138,0,0,'Normal',116);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fdb1b3d603207613a8ed',51,'M','NAP',100,222,0,'Normal',143);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fde6ea8eb1a31bdb1732',60,'M','ASY',136,195,0,'Normal',126);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fe2652aec4a0061dea48',45,'F','ATA',112,160,0,'Normal',138);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('fe2ee65f9c0887abc53d',58,'M','ATA',120,284,0,'LVH',160);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ff92908f6dc1a6bbf73c',45,'M','ASY',120,225,0,'Normal',140);

INSERT INTO analitica(id,edad,sexo,tipoDolorToracico,PAreposo,colesterol,azucarAyunas,ECGreposo,maxHR) VALUES ('ffb7af86e96d8de5b4c1',33,'M','NAP',120,298,0,'Normal',185);

-- SQLINES DEMO *** os de problemática


INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('005ca77f0a82442a2a36','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0066328485e84664ae5a','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('008da106bab758dd8d7f','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('008efab1a9c9cc35ed9a','N',0.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('00a69e2bc3e28699c7a8','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('00a90a012374b7f23e83','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('00c4e5f7c24a74b9a0c5','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('00ff9b3c2145ce21a614','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('013282798d239aaf76f7','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0201ccc2d50cc51df685','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('02108947ab4c9f41a89e','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0251139dfa033ab83381','S',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('026480bc8f13e4cddb72','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('02a391d3845f7011d01d','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('02e595092a429c3127ad','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('030561657982d7182054','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0337473de6b7d0d60c7a','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('03668f27cac6c57ef410','S',3.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('03bdcc3b96133ef4a36b','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('04037a1bbb304ad549b9','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('041762e63be3d800913f','N',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('04bb1063cfbaf536e76a','N',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('04f831889a3e31f2a382','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('05119692af9445d1a2b4','S',2.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('05170b9753a2ccc13a0e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('051d5406835646555541','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('05484af58373a92d2e77','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0580510996f4d6924fd9','N',0.3,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('058cb386505fe46dce8f','S',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('060bbfba8cc415517e2e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('06a319605b20c2aaa985','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('07192329c490f0300244','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('072079f3980006c66a3f','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0724315cf6b8db3f62e3','S',1.9,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('07339c81dbadd1ec2d86','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('075757a8439e991adc37','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('075f80705eb90a20804d','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0780af1e90b677ed3acc','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('078ba9952022e34ecc9a','S',1.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('07af8c89495a7f098d15','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('07bc33fb2298249bdde7','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('08020ae12393eb9b8d4f','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('08ac2619d79678f934b3','S',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('08ce629e407a2a36a95c','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('08d2e1e1ffd57abb04ce','N',0.8,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('09a839160cd9b9a9811a','S',0.9,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('09b241a43627ecec7f9d','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('09cc9c5f21e6db0e5d02','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0a5b63da826feeabe050','N',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0b2338c45193981dc12a','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0c1f348b484c9fe59621','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0c87e72a39cc579d9d42','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0cb2cc107dcd4f345583','S',-1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0cba09ed03fbdbd22ec8','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0dcef7418db4e7c78a85','N',0.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0e208f17ebe26fadde95','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0e3d00d72cd84fa3f737','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0e4a873fac8e3bd6eb23','N',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0e5d9f4c4f92e71539dd','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0e5f31b17ed18ab74f66','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0eba0a3a9e06a8fbe605','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0ee5b3cdc684b245ba17','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0f05456c4af52f3256a5','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0f0c81c864a0182a4e82','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0f47ce4c05ba698298b6','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0f6d1da71fcc5639b090','N',1.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0faee4a23fc5bb06ec6a','S',3.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('0fafb03f8c0963c04a31','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('100d91bf436ce20d4a24','N',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('103eb0df97489b22c14a','N',0.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('10c14b93e58fe5b0bc4f','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1159e76f6e906ca3e4f7','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1179857fe676469486cb','S',1.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('117cf48f978e1469d159','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('11d2e5f86fb82e84342d','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('123404b9a806ae4f7a69','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('12b60640d919244079e0','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('12ececdd5d9d2e784d8d','S',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('143b6ec9df8df5ed37b3','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('14b1b84a51bcb63e4b64','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('14bd5e96a96ec025ce1e','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('150f42da68039ae3973e','S',1.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('15aac02ed43a0c3f90f0','S',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('160956a8045abc636e16','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1652b6c5715b9cb04742','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1686f4d0b39a631fce01','S',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('16b50157884976c1f12d','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('16c547049ddc2a5248d5','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('16d15917ceffd644964d','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('16d419f8f2a497d62596','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1748d76d0f74343991f1','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1761ad63d0fdbdf1e561','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('17c473725bb6410af53e','S',1.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('181df1c6fb5e26a88d03','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('183050239e4f78ba23f9','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('184b33463d4aa8210de5','S',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('187dbe61a92e8e1e9b5a','N',1.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('18db773c3cfd51a47e0c','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1940b467acf46b8bffe6','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('19f9ce2714e84c2daac7','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1a0d0ece3ed0c966080d','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1a4299d1a0bf6d2141a1','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1a4e9047f5d3a7719c2c','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1a68e09672f8cb558c51','S',4.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1a7cc7a2d4214c5da774','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1acc5be5a3330776a848','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1b140b69ad007b4491f0','N',0.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1b39a9d16ba2dcfc5c59','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1b47930ac22d52a8244a','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1b9679a48c2741bccf1b','N',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1c520dc11fb49cce56bc','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1d0138caefac74406987','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1d04f378a0177d185469','N',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1d102cab320054bda840','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1d7ba87490feb2e628f4','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1dd9e5843d317a10dc10','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1de29f41a5eb0dfec84a','N',3.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1deb04ca8abf324497d4','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1e19e2aeecb91e081caa','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1e8a5e45e9196053ef14','N',0.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1eac359b2477953e26cf','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1ebb2aea970cc0c5e921','N',0.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1f0514b2c6b77c5f7637','S',3.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1f19db2c16ea17176535','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('1fada3f3ce12c4b3e39f','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2026f5bd716635a5fcf5','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2108e09951118bcf653f','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2185a085c1cdaa690cf8','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('21e3e23d5b126f5a6ef0','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('21eb56e198d89fbe6563','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2207146e5480474bfab3','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('222937564647e097f58e','N',2.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('225b0a71237de46110c2','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('22642e953103029afec9','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('228c7736416a987b2be5','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('232565526d42e517d846','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('24602682bf556398b51c','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('246f21c013c3127f8f7e','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('24935ca22b08dd85cce9','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('250f0d57d8ce96f8a5d7','N',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('257120de14f6a3402583','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('259fcefb25fb5f6d354a','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('259fea610b528d06fdf1','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('25f91c3fec250e855d94','S',0.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('260b90c701f65c454fc3','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2617f32dff72ec7a4741','N',3.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2684c42def1f1babb733','N',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('275e86a93ea62e0d8bde','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('281e8598421a52fc47a5','N',0.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('283c3e72eb9127b23994','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('28b492e7f1002c1ab63e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('28d05cddb1ccbdf3a43a','N',1.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('28ed4ffd396b58cc016d','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('290514d47832fe8f170e','N',0.8,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('293577953124be8cdb7f','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('29944a9095cfb9283321','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('29c21f1e7830abb4f690','S',1.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('29ec519c133f51d2b982','N',2.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2a3fc0655e63515234eb','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2a8738e3c8717b3e3776','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2abdad2112ebe19c1556','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2b0376696e68aeae269f','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2b51a209835fb219be81','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2b554b465345c14eca79','N',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2b89a721ea9de960972e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2b8c42dacb1fb67bf656','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2bb3452329f8a304e1e1','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2bce14da845b6166ab7f','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2c3ee4561fcdab111be9','S',1.8,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2cbf9e32694883e32058','N',-0.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2e130addd854f4c5524f','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2e92adbac83fd20251ea','S',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2f2c18fe676af8ccadc8','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2f76012ca62619f825b8','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2f8a6500515c3171a949','S',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2fbc5d40de795279d066','S',0.8,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2ffa70ebfd8590abf642','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('2ffac86e793cf6ea4197','N',0.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('31090fc11adcd02c74db','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('310d560851e2e6751cf8','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3165a3cc246620351e7a','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3191e4aba47807c5b0d4','N',1.8,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3207dcfa33a05ca7c2d3','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('32222501edc4f009d420','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3237944cafb1744530c4','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('325d2b89e3e32da103e9','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('330b4bbb170c51f4a6d6','N',1.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('33c7ea68ed2ccf92d3e8','S',-0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3482893bbd16513294ce','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3499d950f3fa9bda988d','N',4.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('351d383ee29ea6b07faf','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('353c2074e7b41a825abd','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('358cbc084fa35e0f037e','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('360e536a28c82ad249a1','N',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('361897723e121208d3e8','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('36392431ec9a365c9fbf','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('36b310782db410f6e53d','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('36f9fd6a60361447e8d7','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('375c93bfef95a9f3d94d','N',0.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('375e8fdd3aa5c1e69409','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3835e3ad907aa5588f43','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('38b5ff881859ec187cf8','N',0.8,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('391f1920a1e918227b10','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('39539c95db5c2417746b','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('39898696eb4eaccfb804','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('39c561bf6ee1e94287d9','N',2.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('39fe73257533cba0433a','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3a06453505803d657aaf','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3a23701eedb201509aee','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3a311f75949ebc9a657b','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3ac84ebe707846be363c','S',1.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3adc1cde526beef4015b','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3b6b80649edf69e65ec1','S',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3c1d798d74988e303a97','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3c6bdb49d63078293186','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3c6ead4c1cad9f107327','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3c7635cc62f5d52c8004','S',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3cd27a9495010914d084','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3cdd4150fa498e521987','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3d275b79a52f91a2bd4b','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3de66d2c0669732fd686','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3e4e20a27465202df850','N',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3e53003b5a28724b17c2','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3efacce4eb39e23e8ae6','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3f12f49d67b6874cc38c','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('3f48441a6b018677adc4','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('40302551f7ba7c2579c3','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('40761c1ab4fa8f2258f3','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('407a5e8e40996d277161','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('407becf76558b7e6e66f','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('408cb5ea3ec8ea5d3d5b','N',1.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('40abcc582d046f76b4d4','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('413202ca26bfdd2d2ae5','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4151fe27fba2f79a193f','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('415360aec870d36085de','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('419f793c8504e5f5c8fc','N',0.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('41a6ceadab2344fd86a0','N',2.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('42dff27f4d56fc0367c0','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('42efd033ad32bee89603','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('43664d740a798929a337','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('438ec18f1c373e6c235c','N',0.8,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('43b9799253d3234eff18','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('43cf2d01d209619c39c1','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('44a6e55ab16675bab669','N',0.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('44ef4919bf7dafbc766d','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('456359ed5e3daaa14156','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4600226215f531b54df5','S',1.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('461569527c228c82d4e8','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('463577207d7b64303ff0','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('46766df7776ef87fb3a1','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('46c53b07094e77c1eb2b','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('46d8810853dfeda0a184','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('46fee7b060395607e09a','N',-2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('471345d5647287e86329','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4731d3f3a373b6e9b53e','S',4.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('474c441c9fe5d04c2eb3','N',0.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('47b28105fe2735496453','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4816e4b24391f9b81957','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('48429557a6d1255bc477','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4884208634466b5c047e','N',0.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('48d1b03ba10e42ee9dec','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('48d3bca064f9582aaaf6','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('496214e2ff777f050652','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('496de333fcbcda23299c','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('49c06e66f6e5084aced5','N',0.9,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('49fa4c1aea3a70296504','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4ac04f2320dfa1f7d49b','N',-0.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4ade525b59e100ca08fc','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4b500a6794f9943a2d8d','S',0.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4b7d899746c5e0ce1116','N',0.8,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4c8382068d4759c47c82','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4ca51205bd8e9c184131','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4ce7a78623e9b5d29578','S',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4ce9b12e2a2691cac186','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4d64340b4579f870fe8d','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4da14f016413618694ae','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4dae3a948fcc68a938b1','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4dc47bd4166b27c0ba35','S',1.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4e357f5932a8281c42f7','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4f5c521decb4336bb8a0','N',0.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4f7fab846130edadfa4e','S',1.9,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4fdd2ff829b2cf545294','N',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4fe652d5008ff504b4d4','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('4ff54558485c44967c1d','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('50142e8e3e54d4e56dfd','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('509927ed5ee3076f6c60','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('50f7fa0a422c79a233d1','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('51cb26894de1e949332b','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('51ff009a7c366a54707f','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('520338d932a5869a578e','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('52941ba31526ca20c714','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5299f68ccb868a4844ea','N',0.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('530cf7fc2afcfbf25e25','N',-2.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('535380e9738f4fdd8ce5','S',3.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('53a164364613a6b534bb','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5465e07af83adc0faa45','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('54a1dc6f3b84d42f7529','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('54c4e7227451f065ca69','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5501a7942e672c7fc7bd','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('551799f28c9e33cbf1e0','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5546164284624a08202b','S',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('55fe30702cbc25fb973b','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5771442dc7508951812f','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5778d9e0af9a3a0c4226','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('582b767f304024c44ff8','N',0.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('584efdf198ce3445f3a7','S',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5856bd04fc16eb7f94bb','S',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('58cf3870cb28f0b23005','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('58d72b8304cf3f948508','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('58f07b75ccb44bddb82f','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5926e1821e832365bcff','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('593fcd44544b7d81ffdc','N',0.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('59746f455ee63fa8e5cd','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5993d4d33512ec2fe3a5','N',1.3,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('59d5bf866d3c594b24b9','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('59ea19bd8e073715ff64','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5a15bda435254712aadc','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5aa06461bbc98db2c94c','S',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5ab1d01c58821d7a3643','S',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5affaedde21c6352ad5b','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5b29fe49a38b8f88610a','S',4.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5b9d2c8aea513988e54d','N',1.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5da480710137645c5c56','N',6.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5db4319dbc1caa795db4','N',2.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5dbb024ee5058e71d06e','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5dcd2e5a891f7269e027','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5e71044c5ff648704af4','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5ee281a390adb914b75c','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5f342d1bd580e06426a8','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5f596c0497a7b080a632','N',0.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5f7ac6b2cfe6b08ca71b','S',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5f7dd41d867a2097f6b7','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5f923cfbeb840d37e586','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('5fdd6bc0c459919fd046','S',1.3,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('603f3fab4eca6b44e8f3','S',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('60ff2ae3fc31f6f050a2','S',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6121c157952126cd2e41','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('613f58bbed9576719095','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('61a1057a1503d1fec90e','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('61b94bff3a8270c96f74','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('61bc7b6278b160d8f050','S',0.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('61cb81e5aad431643f91','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('61e3626c1b01d8ae73d7','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('61f54abf32d95002ac75','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('62008da9a15c5e3d463a','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('620d80fe44a0b0b24a4d','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('621dc196ed5eb5514302','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('62a992dc616f83f8794b','N',2.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('62cb705c83bfc5ed245f','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('62d23df90907f4e6e5e9','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('62e71c22189bafa8476f','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('631964935f468cc31cff','S',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('634ef746de8eac0226ba','S',1.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('63c3becc3690fcd138bd','N',0.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('63f80e2f343e6478c936','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('645819a2c0a05a1faf52','N',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('645bc42975cad43006cd','S',2.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6474071e19e646b3b567','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('648cca9b2bdb8712ae71','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('649d6ad91328fa195d6e','N',3.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('64e770772186914cb247','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('64faea6a70b2add96a6f','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('65269b2bfca58fa9dfba','N',-1.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('65f23cf0679653265a5d','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('65ff51134db1d5f7ce05','S',1.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('66c90dba0219640d4dce','N',-0.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('66d8948c0e444770ebff','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('66d95bd5a85a32e5d9ce','S',0.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('677d17379b502eb3c206','N',4.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('67da6af3af6535bdd855','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('688f83443fd74cdc6776','N',1.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('696ff78d85a2f11ffa20','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6a3cb8f33304e57effff','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6a81b6f966cdddfe4f55','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6b04b330bb23a039ab71','S',0.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6b20fc1847def027931a','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6ba8f8989ddf27ed0a30','N',0.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6bdda919653f41244d28','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6be1170648bd1842d191','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6bf7e8f8ebbc5e5d9f4d','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6c1c069b2ecea71510ae','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6c20b1e758f3ed9956ce','N',0.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6c3a43af1c2e7271a6ed','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6c511a99eee319aff12b','S',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6cc1bfc5b5df1cbc11d0','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6d54c4fe298d1c441e2f','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6d76cc6bf32ebea9e4c3','S',1.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6dc69484a31693314a9f','N',1.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6de4586c2fe6cc927a86','N',-1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6e1209bf2a2a74e3b0c7','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6e556e5fd6cc948c2ce7','N',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6e6ead739b827e06411a','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6ea2a179430b52b8b58f','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6eac16fcab54d3bdb202','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6ebbd31c136e4fc2f1a4','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6ed0710a57920e6e1eb7','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6ed70074561a90fdcd73','N',1.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6ef79bf77bb5f62481a6','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6f28a5491ca569776cef','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6f78813708e43df44f42','N',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6f8f1e7bf87a06d2dde7','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('6ff92004b82c0773370c','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('702ee4221a464e8808c6','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('705f239a55e7ca4dc225','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7066ece32eb790f57183','N',2.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('70c617a57c0c7961154f','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('711b57c91806b7a9409e','S',1.9,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7129d0be95bf80a3a3e7','S',4.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('713d17dc105e219daa4d','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7179ebbec61ecb2a43b6','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('71f11dab7f0316ebf6ce','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('728e4bb9f18c262e1644','N',1.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('72b8824bbbd99c420f09','N',2.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('72d727ecd1084be4ffe4','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7328d51a6bff705848cc','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('734b95122aaa925064a0','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('73e69cd93e24a6155164','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('741c50597524a9c1836f','N',-0.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7479caef0c4b6dd4e729','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('749c02f86f007e999b08','N',3.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('749c40a15c141f432cdf','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('74d33de80bbf05c8d2b8','S',2.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('754eb10a0eed54bca2f5','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7568c485ef37e67bab0c','N',1.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7599f828f1d75bab5c7f','N',1.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('75ff9a032d944ecbf661','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('763534206f32471959c9','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('76dd41fadab889beff63','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7749ab0e6d073e87031a','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7753f66e9674bfb76f7b','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7788cc104dcc4d40e8bd','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('779fb8110c0c43ae1edc','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('77c61affa5cf84ff6aa5','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('791fc5517f426987555d','N',1.9,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7941c859d5624ce337c3','N',0.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('794ebf1c3373386c583f','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7996998147abeb97e85e','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('79aaf5d6d7d7a8e0fd9f','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('79d1ae1126f7f7364023','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('79ee628a131740821e49','S',2.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('79f3cdee243abd8f1612','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7a3e4ce31d5096e392c8','S',3.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7a5ba8b2161927bb2bdc','N',0.3,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7a5e9e05443f63fed646','N',1.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7ac9fffec258467a3321','S',-1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7b03a8838b7040594a80','N',1.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7b22fe65d75e06971d54','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7b375b80de9ad4189b89','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7b721451942d82a48e62','N',2.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7b8319954d27c2378959','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7ba6be017689f912acfe','S',2.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7bd0c8ea2dbbef043783','S',2.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7c5f7e7601fbe0285210','N',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7cc2efc8a04910c522fe','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7d465c69e36ae343d6ba','N',1.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7d4b45d0eeaa3f32bea6','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7d57385c9190ed45a480','S',1.3,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7db8d8d92f3dd870701c','N',-0.9,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7dbe1c32ec89ef96ab50','S',1.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7de4d75a19c03830201f','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('7de71279b1995429a08b','N',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('80306c57afa52a9e802e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('80824b3a1af77a842e5f','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('80a49479fa0a16333070','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('80c58da1cff4b8e7da73','S',2.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('810c44a9149cdca68b4c','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('81262085f71c2e6aacd7','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8138a15b78f9951c9bf2','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('817641636f8b52c969cd','N',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('81c68ff0ec07c99ab3ab','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('81e6f5422d7dba8af646','N',0.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8215e3417c3913f4974c','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8250c16f0f22a736c564','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('83241f4adb7f9524363d','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('837f8ea626775f9b5587','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('83c56140000f2e0dac62','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('84018718b64ca6422e10','N',0.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('84272158dde9d3c9885f','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('843635d41bb8bfd06bd7','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('846ace31851e97d1cd97','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('84dd5c73220b45032fa8','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('851987db65373bc600a3','S',1.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('855df5f6553d1b816b8d','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('857abe972f01728d2a98','N',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('857e848b376432b305bf','S',1.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('85c2ffa2cfdedfa8a354','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('85ce9150439fc1382ab4','S',5.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('85ec360fae83cfd754f1','S',0.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('863e978c4e15dc39d380','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('86b13c09d328f951a35f','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('86c24846680a7dadb821','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('87305ea49d6845260f76','S',4.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8780b8dc1962dbaa5bd2','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8856232d5e8998debdba','N',0.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('887a8a0d8d8c89362ed0','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('88804aac3838e40b6460','S',1.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('889e1a111b034e7849df','N',2.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8952f3ba1a47e88322c7','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8954edafcd7627a9ab03','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8958dbafef1c0bbbe644','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8a0dbfd1abe2df64b0e9','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8a49ee5f7af303a2ec3f','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8a4b332a9ee51025d0f2','N',0.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8a4cc0ef600b61af5e60','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8a72f3425624ae8dc676','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8a8226814a48634439e7','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8acb9d5a7bd6cd9870d8','N',1.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8adfb7329c1f569198c0','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8af1b78177973d6e35bc','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8af822f17a94c9d7ad1e','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8b03a038e6b092ed8f4c','S',1.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8b0cb67d76db27074a07','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8b2430e5a1088953ddcc','N',0.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8b796495c819abc74b61','N',3.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8bbca7a2d165969a38cd','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8c0509972c011dd49ee0','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8c5069969082502a62d3','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8cd42970313adb57ad5c','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8cd5d5998de68d024f38','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8d2e8289a1690fb768f6','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8d463f90297afb61fe10','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8d9ebe00b9970f55e076','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8da885ed8065dcd79398','S',2.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8ddf9c717b28affb353f','N',0.7,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8e1a29b9c14b458ea389','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8efef0f3f8e4f21e4e71','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8eff49b0cf5f1bf06753','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8f84475508656a13c06d','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8f93abac9df233bda1d5','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8fa99fb86c75b13480b1','S',0.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8fc783a9bafef91b5abf','N',2.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('8fd348af0102a25768a5','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('902b0ba9dc9dc7555fac','N',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('909e120b65d69257df33','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9193e48c4ad363d203c1','N',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9220f1809933bf22ac21','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('923a7e16a4d859799f11','S',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('92b8882414b68f4d1f88','N',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('93159f552e3c649ca9dd','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('936504f5fbee30a5e7d2','N',1.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('93855f95a36b9e668442','S',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('93907c3a0ca099cffd2f','N',0.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('93946a01993f85407d17','S',1.9,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('93fb325bfe9c0b30cf43','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('941e81ecb8041aea10e3','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9471b7a223ecbaa9eaa7','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('948ac09d794ed3ecd9ab','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('949a7eebb06e3d7633a0','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('94f56fd3acd705f0625a','S',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('952a6b384b74672d95fb','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9542899d35ff7086dcc9','N',0.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9544882c5181c751bf48','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9571875015abf7061afb','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9586f3d659306edbbdc4','N',1.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9588a1cd843cb70dead1','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9659ca981811785d1eae','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('96f83bda76860efe6133','S',3.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('970490ef41b2a070a72c','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('971a4d47570b9fbf75e1','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9733264811b326b07421','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9762e58320b5bcb733d3','N',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('97af929407f2b3817943','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('97d60bd0959f7b14072b','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('97e8cc17ededa8bf563d','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('97eee2a2a37a7075b0bf','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('982780715b51277b3b7f','S',2.9,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9848a15c2a5764f852f0','S',4.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('98558664c9b12ac1fb71','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9857a8cc9d0ce9b11af3','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('98966ba6058cb5773967','S',2.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('98c4d351b3c49e102754','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('990b87952b0786a895f1','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('99307b05d52059652a03','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9979bfd32e4f4dc0d3a9','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9987bbae55fc81a124c5','S',1.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('99af713b9a23e335d371','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('99f5fa8f6c8ab74d1ffb','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9a0552038cc6a2ae1416','N',0.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9a0abc4d63b8c5d11e35','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9a4f6e2cf51f5b733be9','N',2.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9af1d8a460aeb536f1d1','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9c486e72038d2c7fc500','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9cb7e06126b9fa119ae3','N',0.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9cc248bb00efa9bbc101','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9cfc918593ce722591e4','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9dccd95a40086739f631','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9e5e5348d2c9e4e210f9','S',0.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9e67077719ea86a0de0f','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9e8bcb0ef98303e051c3','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9eada5265c3e77ff4c1d','S',0.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9ecb363c3c9a6ac56c6c','N',0.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9ecedec61d2d1fa1dcbb','N',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9eee1a9659889a63a9ad','S',1.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('9f53dabc018ddd75db88','N',0.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a03f473fa2f83d9721e0','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a04ce3bd691deda1d068','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a04ebb854aa2cb74cbdb','N',0.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a08c9a11799bb1932606','S',1.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a09c0024311441fe1f16','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a100493b836755314fe2','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a10cf000b81b55895b61','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a1bd40a9f2b95a49c307','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a1d62eda8f40de89d835','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a255181870b54fbc11ac','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a268a8d42f0d183b1cd8','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a290b7aa7c7e51571187','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a3331d3fa3e03bb2538e','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a394c755da3212da6e2b','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a3e9ba930a7c4a8b28b3','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a456037768b0aeb1cfb4','N',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a4b783969d0afe9b09f3','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a5726af25af628b66a8e','S',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a5b6bbfee19f48afa007','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a5f69b20b65ce0f0ba06','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a61f30ef4bcdf428c6f3','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a66b1265b5b111d5159b','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a693bd7548e1e2b5fc6c','N',0.7,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a6c635c6df0ffadd3816','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a6e4e6913d43f224f7e3','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a7219f63d9902c3d2213','N',0.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a7959864cc69db94898a','S',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a7a203b73a759dd062a8','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a89bc5f911ded4a6bcd7','N',0.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a8d9790143f25d2fc86c','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a8f4a38cfa4a27b20ff3','N',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a94651429008fca5f6a3','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('a9fb85b7aa7e63196c23','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('aa47a114faff2029d952','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ab6d7cc8a6413418af66','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ab79a0258648cbbb9d3e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ac19e15b005f3f3e0b09','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ac40734abc6e4b7d8342','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('acc49d9c7de6e82fe473','S',2.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ad7fe3ddb5cf981cb86a','S',5.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ad825ecc095f61379eda','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ae4af76ca8f02746f45b','N',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ae9930e73ef51a18b2e4','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('aea3590d6124c94e1658','N',1.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('aeb709d7bb57e5eda213','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('af6aaed45d567230dc01','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('afa16017c9431851df1c','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('afaeadc39747db401021','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('afce08abcdd167c4ea36','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b037e7bb8c87e6720994','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b069c60123c2edb8b968','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b07b2ca45c3f552ffb0e','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b104b36dba7de175a591','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b13532d9285dcb231632','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b165f69cf1bd157682a2','N',1.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b189de7a16e5cec9af5f','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b1963f7aff9d19f3c67e','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b1f1b0658a24899862b7','N',0.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b2272e1b7abcdb9770d0','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b234043a2a6fc3158cf1','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b275d9fc7a8c30c78de7','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b2b74a2fc2d6d7e4ccf6','S',1.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b2ca761ec994d723d65c','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b2f5992c7451b2737d24','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b37ca4d4b5a96db3d512','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b3a4f7e64ce3e80f6579','S',3.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b3aa363d1b7f02fc2a07','S',0.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b40f9a278bc7627cc9d1','S',1.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b4967282b915bc7e8cfe','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b49d1180d02700272302','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b4d91514d327dee349d7','N',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b50ee0febb919c44f3f4','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b56a14d6492d69c2202e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b571d3764f616405760a','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b5724232adbcd76c5036','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b57d6a6cbb9bcb61f822','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b5e5c0e313c9d72355c1','S',1.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b605d3640d7d61372277','N',1.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b639d49358b9232ee67f','N',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b63a75be2b25a3f0814a','S',0.9,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b674bd761c16dc804445','S',0.9,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b67592c5ac3be41852e2','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b6bf46d795338f005f2e','S',4.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b6cfa0928f16ca6021cf','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b74487726ee875f0428a','N',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b761cd0a9fbb2131472b','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b7ab6f450b597e3a9ddb','N',0.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b7c861c23a7779e623f6','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b8012e068247c8c34c5d','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b86805cd33d296d4304a','N',3.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b8d843e7a36db27f36c1','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b91ade4f3003e0b8c562','S',3.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('b9d63e9539c47db691e7','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ba1efe225bc9f3ce699e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ba3945111a67f42fa6cf','N',0.8,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ba908396787fb1dfb550','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ba97de7ddbba8fcde340','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('bb27d55e5eaafac2dc15','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('bb725aaac3b41040e8c4','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('bc44829591394d6bca69','S',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('bcc7a01da3f6644a541f','N',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('bcce1d02c59d8a8e257e','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('bcf6da56f37d5c37edbb','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('bd23fa4e41ee4acf4a8e','N',0.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('bec66112ff506980e8ae','N',0.8,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c0021b7c523930a28220','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c022b909e5d32d9724d0','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c05220bec00cf1c441a3','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c06c3728b9817df143eb','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c0a242e1aea08bf0e578','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c12eff33e720df4a2150','S',1.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c16d94f4603804968135','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c1fddd2bb0bb00604dc9','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c247ca59acac51c21e0f','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c2541f8e31893820f436','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c2773bc61640bdd6d641','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c277e63535998f5140cf','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c2901db0a4b115f731b2','N',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c2c09151ca50034dd4c1','S',2.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c2e5e3ed4c0d107f2daf','N',0.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c2fb81aa6f80eac6ac9f','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c378123f4db714267034','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c3cdc462bd68a9bbdc71','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c3d02f8a4b3dd0899dfb','N',1.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c44767e4179dc1d571ca','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c4640482486a239966fe','S',0.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c51b33ab48daf3227a7f','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c52196c899f37c325461','N',0.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c52f84ba4388e944b7b2','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c553e2f73b780c5201c8','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c57e2947cf8d57a4c43c','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c5e591e8d5f800c6aa39','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c60f2d8974011428f9f7','N',1.9,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c6454b1dd89911c82dd1','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c69b0d5916408d15c5f4','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c6b0c30c6e4d19c6df1c','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c6bd1719a17dd8bb2c6a','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c6e2281e8081e324d582','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c7279410645c62009691','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c7bca8c3a49e59e38b37','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c7c7313d14192876f570','N',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c7cf644ab0bc2273d4c8','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c7f21625dd930d71d7c0','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c80081bc37851d8976f5','N',1.9,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c83e6a99a5ecda2b14ed','S',3.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c8875bb7aa4973b17e32','N',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c8d5f38ea49679f95d3c','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c97bbe78ab43e5b46260','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c9973bc22051c2b5a258','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c9e1c888fd882c60ed8d','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('c9e3a75b101d9ef47915','S',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ca17a6264f3e18b7e795','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cafafbad11c37b59658a','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cb4e1c2818ad5f50f761','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cb65a36d8fa3c1a950cc','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cc17b4e3205e2c225296','N',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cc32f70fdae371873b9c','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cc35fd06f8fcfe23acbe','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cd1a6fb927f8f31b8563','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cd49724e71edbb720a51','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cd78826fd4d779d88347','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cd7a8511721c4cc0428f','N',0.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cd9454c6f5b527cedfb1','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cdaf0a9a7b6ec37ca4ae','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ce0a4a92fb02af6c1d8c','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ce405c066b57d35b4f52','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ce8e8c616fea827e3398','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ce99e36a6db54d2eb52f','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cea7046f0990109db078','N',0.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ced5aaca78765205999d','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cf297a3ee5c2222abb9e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('cf93bb51596a20946332','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d011cca0fe4204d1155e','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d026e595b37eadf67a5e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d04672cc1ac239543404','N',0.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d06561190cc09921537c','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d06d7e1d41eb09d7e40b','N',4.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d0a35f709b2e7534aaca','N',1.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d143b4bd56d3bce7114c','N',1.8,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d1a21e48644308f03fac','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d2915fe5d2ef1a3ad8d3','N',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d3056593ecfc00e1787b','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d3173363fe7ce8fd665b','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d37aa773624862c32f9e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d3ad60832b0628a0332b','N',0.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d3f7e35b4973f1758407','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d414a92b52c7bec9c2fe','S',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d49ba9983358750c9fbc','N',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d4d64933ba47ccc68e1f','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d4f1e6bbd4f413b44149','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d54df4bc3fc70288e985','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d619cfbdacdbe7d14c85','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d65b5abd1338c90cb693','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d666b268657fc650b080','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d72c38d06868a1d2af82','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d767fa4e13be2a53a7e5','S',1.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d79717af0595636d8265','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d862bc5f1d8195863d11','N',0.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d8f9464ab63d109848eb','N',3.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('d96f0dbb7de32f841b8f','S',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('dc78474de68634e46db4','N',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('dc840a490bad9d13e794','N',0.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('dcb4e63b37427b83d5b9','N',0.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('dd86b13a9cb9da8cb0b3','N',0.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('dddc01b2b648e6d079ad','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ded1419535ad9dfff1bc','N',0.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('df69c9eb45e8d9e4fd1b','S',0.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('dfca078bd26a9a87e633','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e02a2e51aa3591c8b821','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e03c52d59b2be7e8ac18','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e04fe93c044147be1ec2','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e093b7cfcdefa2b0b894','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e0d376b447cd987a96e3','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e10bb6acf1ad9ed29579','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e127982a0b2abe23a756','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e1b763580797c8f1d7df','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e1c3a96d29ab2470b06d','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e1c7dd0ef35b589b2691','S',0.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e21b1cf66d867de80828','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e270fd45fc5f16bfb653','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e27a3fabd7399b5ec9ce','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e2ba71b84725e77407ce','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e2ed28c2de4a071412a0','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e35cf40b39314cd7747d','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e434f197c69118c50a96','N',2.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e443321db9cab7b7f67c','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e47b00081b4415e9ebfc','S',1.1,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e4a6cd8c8c0984ec0657','S',0.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e4af61754aa4e3667542','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e4b01f616560dedc7abc','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e50d98ab8f192c6d1520','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e52c429d025c28a14a01','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e5ae6140315c2197efe7','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e5dfe5d5b23e5e2be8df','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e5e97e8b867eb2bd7fd2','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e5fa670e12476b1699ea','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e601616d022ae9522232','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e6280f375964bffa06aa','S',1.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e637661a1b15e5954a6c','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e70ccabd3dba712a9cbb','N',0.4,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e7b90003df78d8890f4c','N',2.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e7c1facc3ac4380b2086','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e847d257d98437c41eda','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e89867c4eab43e0c1ff0','S',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e8ce51d051e221a03bec','N',0.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e8e9d0520e88d37fc342','N',0.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e95402913472adf95459','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e9590b7be9a3c23bfffe','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e99e1a4697740a4f33fa','N',0.3,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('e9e7b144132199c3f716','N',2.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ea3238a7f6a7b34f74e6','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('eab2e983c3987903a621','N',1.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('eb0e0122e59aac3750d1','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('eb305bd5ad7a99a557b2','S',1.3,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('eb7440b1c6855345d3c9','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('eb7dfc417773c71ef83f','N',0.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('eb807ff0b4fe84188d92','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ebb8caba64b8ec3d52de','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ebf72a7f8af4b239719a','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ec3cd28364c5a3937e98','N',1.1,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('eccbd251aeeee19ca29e','S',2.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ecd8355872459995b79f','S',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ecf75e1e7f1c5236d843','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ed0dbed1deb70ca393f2','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ed3c4144287c6253b753','S',1.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ede27b0b37cc04b1cecb','N',1.5,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ee63aef3cbece762a4e6','N',3.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('eeaff1fd2aa7486035db','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ef63561f760d24450eb3','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f0187eb04f0c90aabdbd','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f045dcc8bb2c1a26a131','N',2.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f048ba2fd3d8512e78b7','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f057f357cce736a20c30','N',0.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f0aec99be41f1086f920','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f10fb762b0cde633f999','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f1c6efcd944e6c342086','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f1ccef066c1b3208264b','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f2175e2d6379df0eb9c2','S',2.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f26e72ecc000b883902b','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f2b0f4f214f32d387088','N',1.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f31fdf20288785eaf76f','S',1.6,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f37b452ee63e7768476e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f3c4b7bf12a50030340e','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f3cb0de59bc2187fc55c','S',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f3f852e3dfac8d992821','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f455c091446f4a896d22','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f4bb0014603d7885dc90','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f4dd2b6289d9ca72299b','N',1.4,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f4eb6fec3e7060ace016','S',2.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f4ef5c32c90130a8c89a','S',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f4f8e071ec7a25ae387c','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f5369996a3394f089b9d','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f5674e8610c34e60db7e','N',1.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f597905831fd5328b831','N',-0.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f5e9e19813cc2e2f8101','S',0.7,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f5f223195078cda68156','N',1.5,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f6579542b2b89337a4a9','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f66cc7245968b773a934','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f6810d50c14eb77bc7a7','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f681570296d45cc2631e','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f705eb9f27a12dca7723','S',1.3,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f73fcd93cfd3fc92f7ed','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f7ccc63b371cfb6c9852','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f905256beb7d7861a3d6','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f95e0e926a0a836afc6e','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f98438b9fa6403ae78ad','N',3.2,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('f9f7ea2db3843fb6018c','N',0.6,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fa548bd3dc821697e60a','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fab250a5015cb4028345','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fb6fa9ef7558c2bf3ac5','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fb8b118ac7c54dfb89cc','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fc47e793b17c83e7491e','N',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fc790f8b8d7b7b0c5d81','N',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fc7ca08b9abb99d8afa4','S',4.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fcab7c548a3b8b7a3a76','S',1.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fccd9b2902ee7fbcae3d','S',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fcdbe9c748fd21cfb670','S',0.0,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fd5ca37a4b3fad528053','N',0.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fdb1b3d603207613a8ed','S',1.2,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fde6ea8eb1a31bdb1732','N',0.3,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fe2652aec4a0061dea48','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('fe2ee65f9c0887abc53d','N',1.8,1);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ff92908f6dc1a6bbf73c','N',0.0,0);

INSERT INTO problematica(id,anginaEjerc,depresion,enfCard) VALUES ('ffb7af86e96d8de5b4c1','N',0.0,0);

COMMIT;

SET AUTOCOMMIT ON;
-- enfermedades2;
select * from analitica,problematica;
-- Realizar las tareas de forma segura para cada ejercicio, de forma que cuando se hagan inserciones o modificaciones, se haga en las dos tablas a la vez o en ninguna, permitiéndonos deshacer los cambios en cada ejercicio.
-- 1. Agregar la información del paciente p000111222333444ABCD. La presión arterial en reposo es de 124, su nivel de colesterol es 146, no tiene azúcar en ayunas y no presenta ninguna enfermedad cardíaca. El resto de datos te los puedes inventar.

INSERT INTO analitica (id,edad, sexo, tipodolortoracico, pareposo, colesterol, azucarayunas, ecgreposo, maxhr)
VALUES ('p000111222333444ABCD',35, 'M', 'ASY', 124, 146, 0, 'Normal', 175);

INSERT INTO problematica (id, ANGINAEJERC, DEPRESION, ENFCARD)
VALUES ('p000111222333444ABCD','N', 0, 0);

COMMIT;
-- 2. Modifica los datos de la persona anterior, para decir que ahora sí presenta una enfermedad cardíaca, que se produjo durante el ejercicio, el tipo de dolor torácico es
--ATA y su frecuenca máxima cardíaca es de 186.

DELETE FROM PROBLEMATICA WHERE id = '18db773c3cfd51a47e0c';

SET TRANSACTION READ WRITE;

INSERT INTO problematica (id,ANGINAEJERC,DEPRESION,ENFCARD)
VALUES('18db773c3cfd51a47e0c','N',0,0);

UPDATE problematica SET enfcard = 1 WHERE id = '18db773c3cfd51a47e0c';

UPDATE analitica SET tipodolortoracico = 'ATA', maxhr = 186 WHERE id = '18db773c3cfd51a47e0c';

select * from problematica WHERE id = '18db773c3cfd51a47e0c';

COMMIT;
-- 3. Borra los datos de ese mismo paciente.

DELETE FROM analitica WHERE id = 'p000111222333444ABCD';
DELETE FROM problematica WHERE id = 'p000111222333444ABCD';

COMMIT;

-- Piensa: ¿cuándo se han guardado los datos en cada uno de los ejercicios?
-- Cuando se ejecuta el comando commit al despues de cada ejercicio;


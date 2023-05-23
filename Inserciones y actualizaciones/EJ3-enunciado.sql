-- enfermedades;
SELECT
    pacienteid,
    edad,
    sexo,
    tipodolortoracico,
    pareposo,
    colesterol,
    azucarayunas,
    ecgreposo,
    maxhr,
    anginaejerc,
    depresion,
    enfcard FROM enfermedades.corazon;
-- 1. Agregar la información de la analítica, para el paciente 1001. La presión arterial en reposo es de 124, su nivel de colesterol es 146, no tiene azúcar en ayunas y no presenta ninguna enfermedad cardíaca. El resto de datos te los puedes inventar.
DELETE FROM ENFERMEDADES.CORAZON WHERE PACIENTEID=1001;
INSERT INTO enfermedades.corazon( 
    pacienteid,
    edad,
    sexo,
    tipodolortoracico,
    pareposo,
    colesterol,
    azucarayunas,
    ecgreposo,
    maxhr,
    anginaejerc,
    depresion,
    enfcard) VALUES(1001,40,'M','ASY',100,0,1,'ST',133,'N',0,0);

-- 2. Modifica los datos de la persona anterior, para decir que ahora sí presenta una enfermedad cardíaca, que se produjo durante el ejercicio, el tipo de dolor torácico es ATA y su frecuenca máxima cardíaca es de 186.


-- 3. Intenta deshacer los cambios que has introducido en esta base de datos. ¿Se puede hacer? ¿Por qué motivo?


-- 4. Realiza el proceso adecuado para introducir los datos del paciente 1002, inventándote todos sus datos, pero indicando que SÍ tuvo una enfermedad cardíaca. Realiza las operaciones necesarias para asegurarte que este proceso pueda ser deshecho.


-- 5. Modifica los datos del paciente 1002, para indicar que hubo un error en la creación de sus datos y NO tiene una enfermedad cardíaca y que el nivel de depresión es 1.15


-- 6. Deshacer los cambios. ¿Se puede hacer? ¿Por qué motivo? ¿Hasta dónde llega deshaciendo los cambios?




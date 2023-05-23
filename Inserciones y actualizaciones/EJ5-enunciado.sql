-- jardineria;
SELECT * FROM JARDINERIA.oficina;
-- Realiza las siguientes operaciones, cuidando de respetar las operaciones que deban ir unidas entre ellas.

-- 1. Realiza la inserci�n de una nueva oficina en Madagascar, en su capital. El resto de datos puedes rellenarlos como desees, invent�ndote los datos.
INSERT INTO JARDINERIA.OFICINA(
    codigo_oficina,
    ciudad,
    pais,
    region,
    codigo_postal,
    telefono,
    linea_direccion1,
    linea_direccion2)
    VALUES('MAD','Antananarivo','Madalascar','Africa',1000,'+99 1234','Cojon tieso',null);


-- 2. Agrega los siguientes empleados: Maggie Smith, Peter Sellers y David Niven. Debes asegurarte que no tienen ning�n jefe, y que se insertan todos los registros, o no se inserte ninguno. Inv�ntate sus datos, pero asign�ndolos a la oficina de Madagascar que creaste en el ejercicio anterior.
SELECT
    codigo_empleado,
    nombre,
    apellido1,
    apellido2,
    extension,
    email,
    codigo_oficina,
    codigo_jefe,
    puesto
FROM
    empleado;

INSERT INTO jardineria.empleado(codigo_empleado,
    nombre,
    apellido1,
    apellido2,
    extension,
    email,
    codigo_oficina,
    codigo_jefe,
    puesto)
    VALUES(32,'Maggie','Smith',null,342,'aklsdjfklasd','MAD',null,'Secretaria');
    
    INSERT INTO jardineria.empleado(codigo_empleado,
    nombre,
    apellido1,
    apellido2,
    extension,
    email,
    codigo_oficina,
    codigo_jefe,
    puesto)
    VALUES(33,'Peters','Sellers',null,342,'aklsdjfklasd','MAD',null,'Secretaria');
    
    INSERT INTO jardineria.empleado(codigo_empleado,
    nombre,
    apellido1,
    apellido2,
    extension,
    email, codigo_oficina, codigo_jefe, puesto)
    VALUES(34,'David','Niven',null,342,'aklsdjfklasd','MAD',null,'Secretaria')
    ;

-- 3. Modifica los datos de los empleados de antes, ya que han indicado que la jefa de la oficina es Maggie Smith. A su vez, Maggie tendr� como jefe a Marcos,
--con c�digo de empleado 1.
SELECT CODIGO_EMPLEADO FROM JARDINERIA.EMPLEADO WHERE NOMBRE='Marcos';
UPDATE JARDINERIA.EMPLEADO SET CODIGO_JEFE=1 WHERE CODIGO_EMPLEADO=32;


COMMIT;
-- 4. Date de alta como cliente, y aseg�rate de guardar tu identificador en alg�n sitio.
SELECT codigo_cliente,nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito
FROM cliente;

INSERT INTO JARDINERIA.CLIENTE(codigo_cliente,nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, codigo_empleado_rep_ventas, limite_credito)
VALUES (39,'Alex','jordienp','pine',122345,52340985,'fasdf','asdf','vfdsva',null,'Spain','342',4,23452345);


-- 5. Realiza un pedido con al menos 3 productos ya existentes, asegur�ndote de realizar tambi�n el pago. Haz este apartado de tal
-- forma que nos aseguremos que se hace toda la inserci�n (con su pago) o no se hace ning�n paso si hubo alg�n fallo.
SET TRANSACTION READ WRITE;
SELECT CODIGO_PEDIDO, FECHA_PEDIDO, FECHA_ESPERADA, FECHA_ENTREGA, ESTADO, COMENTARIOS, CODIGO_CLIENTE FROM JARDINERIA.PEDIDO;

INSERT INTO JARDINERIA.PEDIDO(CODIGO_PEDIDO, FECHA_PEDIDO, FECHA_ESPERADA, FECHA_ENTREGA, ESTADO, COMENTARIOS, CODIGO_CLIENTE)
VALUES (129, DATE '2020-01-17',DATE '2020-01-17',null,'Entregado',null,39);

COMMIT;
SET AUTOCOMMIT ON;

INSERT INTO PAGO(CODIGO_CLIENTE, FORMA_PAGO, ID_TRANSACCION, FECHA_PAGO,TOTAL)
VALUES (39,'cHEQUE','AK-ST-000029',DATE '2022-10-10',9999);




-- Todas las gamas de producto y producto
SELECT count(*)
FROM gama_producto left join producto on (gama_producto.gama=producto.gama);
--

select * from oficina o left join empleado e on (o.codigo_oficina=e.codigo_oficina);
--
select * from gama_producto where gama not in (select distinct gama from producto);
--
select * from oficina o, empleado e where o.codigo_oficina =e.codigo_oficina;

-- Oficinas con mas empleados que la ocupacion media de las odificnas.

























-- Consultas sobre jardineria

-- 1.Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Ten en cuenta que no deben aparecer formas de pago repetidas.
select * from cliente;

-- 2. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordena el resultado de mayor a menor importe.


-- 3. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.


-- 4. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.


-- 5. Listar la dirección de las oficinas que tengan clientes en Fuenlabrada.


-- 6. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.


-- 7. Devuelve un listado con el nombre de TODOS los empleados junto con el nombre de sus jefes.

 
-- 8. Devuelve un listado que muestre el nombre de cada jefe (ES DECIR, TIENE EMPLEADOS POR DEBAJO) y el nombre de su jefe superior.


-- 9. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
select unique(cliente.nombre_cliente)from cliente 
join pedido on pedido.codigo_cliente=cliente.codigo_cliente
where pedido.estado='Pendiente'

;

-- 10. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

select * from cliente;
select * from producto;
select * from pedido;

UPDATE cliente
SET limite_credito = (SELECT sum(precio_proveedor*precio_venta)
                    FROM producto
                    join detalle_pedido on producto.codigo_producto = detalle_pedido.codigo_producto)
                    ;
select limite_credito from cliente;


select unique(gama),cliente.nombre_cliente,cliente.nombre_contacto,cliente.apellido_contacto from detalle_pedido
join producto on detalle_pedido.codigo_producto=producto.codigo_producto
join pedido on pedido.codigo_pedido=detalle_pedido.codigo_pedido
join cliente on cliente.codigo_cliente=pedido.codigo_cliente
;

INSERT INTO jardineria.cliente (codigo_cliente,nombre_cliente,pais,region,ciudad,telefono,fax,linea_direccion1)
VALUES(666,'Alex','Espa�ita','Ciudad la real','torrlaba',991,123,'asdf');
select * from cliente where codigo_cliente=666;
delete from cliente where codigo_cliente=666;
select * from cliente;
---
select count(nombre_cliente),pais from cliente where (limite_credito < (select avg(limite_credito) from cliente)) group by pais;

UPDATE cliente SET 
limite_credito=(SELECT avg(limite_credito) FROM cliente) where codigo_cliente=666;

UPDATE JARDINERIA.CLIENTE SET LIMITE_CREDITO=1234 WHERE CODIGO_CLIENTE=666;
SELECT * FROM CLIENTE;

select * from detalle_pedido
LEFT join producto 
on detalle_pedido.codigo_producto=producto.codigo_producto
;























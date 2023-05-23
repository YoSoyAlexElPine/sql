-- Base de datos: jardineria.sql
select * from producto;
-- 1. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
select unique(estado)from pedido;

-- 2. Devuelve un listado con el co�?digo de cliente de aquellos clientes que realizaron algún pago en 2008.
select codigo_cliente from cliente where date 'AAAA-MM-DD'>'2008-01-01';

-- 3. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
select pedido.codigo_pedido,cliente.codigo_cliente,pedido.fecha_esperada,pedido.fecha_entrega from pedido
join cliente on (cliente.codigo_cliente=pedido.codigo_cliente)
where pedido.estado='Pendiente';

-- 4. Muestra el nombre de los clientes que NO hayan realizado pagos, junto con el nombre de sus representantes de ventas.
select * from pago;
select cliente.nombre_cliente from cliente
join pago on (cliente.codigo_cliente=pago.codigo_cliente);

-- 5. Devuelve el nombre de los clientes que han hecho pagos, así como el nombre de sus representantes (junto con la ciudad de la oficina a la que pertenece el representante).
select nombre_cliente,nombre_contacto from cliente where codigo_cliente in (select codigo_cliente from pago);


-- 6. Información de las oficinas que tengan clientes en Fuenlabrada.
select * from cliente;
select * from oficina;
select * from producto;
select * from oficina
join producto on (producto.codigo_producto=oficina.codigo_oficina);

-- 7. Listado que muestre solamente los clientes que NO han realizado ningún pedido.
select * from cliente
join pedido on (cliente.codigo_cliente=pedido.codigo_cliente)
where codigo_pedido is null;

-- 8. Mostrar todos los datos de los empleados que tienen un cliente asociado.


-- 9. Información de los empleados que NO tienen un cliente asociado.
select * from empleado;
select * from cliente;
select * from empleado
join cliente on (cliente.codigo_cliente=empleado.

-- 10. Oficinas que tienen al menos UN empleado asociado a esa oficina.
-- Resolver con INNER JOIN
SELECT unique *
FROM oficina o
INNER JOIN empleado e
ON o.codigo_oficina = e.codigo_oficina
;
-- 11. Oficinas que tienen al menos UN empleado asociado a esa oficina.
-- Resolver con SUBCONSULTAS
select * from oficina
where oficina.codigo_oficina in (select codigo_oficina from empleado group by codigo_oficina)
;


-- 12. Oficinas que tienen al menos TRES empleados asociados a esa oficina.
-- Resolver con SUBCONSULTAS

SELECT * FROM oficina
WHERE oficina.codigo_oficina IN (SELECT codigo_oficina FROM empleado GROUP BY codigo_oficina HAVING COUNT(codigo_oficina) > 3)
;


-- 13. Información de clientes que NUNCA han pagado con paypal.
select nombre_cliente from cliente
join pago on (pago.codigo_cliente=cliente.codigo_cliente)
where forma_pago<>'Paypal'
;
set transaction read only;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET TRANSACTION READ ONLY;
commit;
-- 14. Indica qué  personas NO tienen empleados subalternos (empleados por debajo de esa persona).

SELECT * FROM pedido WHERE fecha_esperada < TO_DATE('2022-01-01', 'YYYY-MM-DD');




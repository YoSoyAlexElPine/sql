create or replace function ClienteBuscaProdPrecio (clienteID INT,precioMinimo number,precioMaximo number, gamaBuscada char) return number
is
    verifClienteId number default 0;
    retorno number := 1;
    numAleatorio int:=dbms_random.value(1,999999999);
    verifIdBusqueda number;
    c_codigoProducto varchar2(14);
    c_precioVenta number(15,2);
    c_proveedor varchar2(50);
    cursor c is select CODIGO_PRODUCTO,precio_venta,proveedor from producto where (precio_venta>precioMinimo and precio_venta>precioMaximo and gamaBuscada=gama);
begin

--Contamos los clientes con el id proporcionado 
select count(*) into verifClienteId from cliente where CODIGO_CLIENTE = clienteID;

if verifClienteID>0 then
--Segunda condicion
if precioMinimo>precioMaximo THEN retorno:= -2;
    elsif precioMaximo<precioMinimo THEN retorno:= -2;
    elsif precioMinimo<0 THEN retorno:= -2;
    elsif precioMaximo<0 THEN retorno:= -2;
end if;--Fin de la segunda condicion
if retorno > 0 then
--Tercera verificacion
    if UPPER(gamaBuscada) not in ('F','H','A','O') then
        retorno:=-3;
    else --Si cumple todos los requisitos
        while verifIdBusqueda>0 loop
            numAleatorio :=dbms_random.value(1,999999999);
            select count(*) into verifIdBusqueda from BUSQUEDASINTERNET where ID_BUSQUEDA=numAleatorio;
        end loop;
        retorno := numAleatorio;
        open c;
        loop
            fetch c into c_codigoProducto,c_precioVenta,c_proveedor;
            exit when c%notfound;
               INSERT INTO BUSQUEDASINTERNET(ID_busqueda,cliente_codigo,producto_codigo,precio_venta,proveeder_codigo) VALUES (numAleatorio,clienteID,c_codigoProducto,c_precioVenta,c_proveedor);
    
         end loop;
    end if;--Fin del algoritmo en caso de busqueda valida
end if;--Fin del if si el problema fue la segunda condicion
else --Else primer verificador
retorno:= -1;
end if;--Fin del primer verificador
return retorno;
end;--Fin de la funcion
/





declare 
n1 number:=&id;
n2 number:=&precio_min;
n3 number:=&precio_max;

BEGIN

DBMS_OUTPUT.PUT_LINE('Resultado funicion = '||ClienteBuscaProdPrecio(n1,n2,n3,'f'));

END;
/

select * from cliente;





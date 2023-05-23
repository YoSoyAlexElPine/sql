CREATE OR REPLACE FUNCTION ContarProductosRangoPrecios(vMin number, vMax number) RETURN NUMBER
IS
  vCount NUMBER :=0;
  CURSOR c_productos IS SELECT idProducto, precio FROM Producto;
BEGIN
  IF vMin > vMax THEN
    RETURN -1;
  END IF;
for p in cProductos loop 
    if p.precio >= vmin and p.precio <= vMax then
        vCount := vCount+1;
    end if;
    END LOOP;
return vCount;
END;
/

DECLARE
  vResultado NUMBER := 0;
BEGIN
  vResultado := ContarProductosRangoPrecios(10, 20);
  dbms_output.put_line('Cantidad de productos en el rango de precios: ' || vResultado);
END;
/



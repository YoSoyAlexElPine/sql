CREATE OR REPLACE FUNCTION ContarProductosRangoPrecios(vMin number, vMax number) RETURN number
IS
  v_contador number := 0;
  v_producto_id number;
  v_precio number;
  CURSOR c_productos IS
    SELECT idProducto, precio FROM Producto;
BEGIN
  IF vMin > vMax THEN
    RETURN -1;
  END IF;
  
  OPEN c_productos;
  LOOP
    FETCH c_productos INTO v_producto_id, v_precio;
    EXIT WHEN c_productos%NOTFOUND;
    
    IF v_precio >= vMin AND v_precio <= vMax THEN
      v_contador := v_contador + 1;
    END IF;
  END LOOP;
  CLOSE c_productos;
  
  RETURN v_contador;
END;
/
DECLARE
  v_resultado number;
BEGIN
  v_resultado := ContarProductosRangoPrecios(10, 20);
  dbms_output.put_line('Cantidad de productos en el rango de precios: ' || v_resultado);
END;
/

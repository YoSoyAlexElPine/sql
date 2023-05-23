CREATE OR REPLACE PROCEDURE ContarProductosSuperior(p_precio number, resultado out number)
IS
  v_contador number := 0;
  v_precio number;
  CURSOR c IS
    SELECT precio FROM Producto;
BEGIN
  FOR producto IN c LOOP
    v_precio := producto.precio;
    IF v_precio > p_precio THEN
      v_contador := v_contador + 1;
    END IF;
  END LOOP;
  
  resultado := v_contador;
END;
/

DECLARE
  v_resultado number;
BEGIN
  ContarProductosSuperior(20, v_resultado);
  dbms_output.put_line('Cantidad de productos con precio superior a 20: ' || v_resultado);
END;
/



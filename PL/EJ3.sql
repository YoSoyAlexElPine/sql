CREATE OR REPLACE FUNCTION ExisteClienteById(pIdCliente NUMBER) RETURN BOOLEAN 
IS
vCount NUMBER;
BEGIN
  SELECT COUNT(*) INTO vCount
  FROM Cliente
  WHERE cliente.codigo_cliente = pIdCliente;
  
  IF vCount > 0 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END;
/

CREATE OR REPLACE FUNCTION ExisteClienteByName(pNombreCliente VARCHAR2) RETURN BOOLEAN IS
  vCount NUMBER;
BEGIN
  IF pNombreCliente IS NULL OR pNombreCliente = '' THEN
    RETURN FALSE;
  ELSE
    SELECT COUNT(*) INTO vCount
    FROM Cliente
    WHERE cliente.Nombre_Cliente LIKE pNombreCliente;
    
    IF vCount > 0 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END IF;
END;
/

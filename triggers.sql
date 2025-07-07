DELIMITER //


CREATE TRIGGER crear_factura_alquiler
AFTER INSERT ON Alquiler
FOR EACH ROW
BEGIN
    INSERT INTO Facturas (Saldo, ID_Alquiler)
    VALUES (0, NEW.ID_Alquiler);
END;
//


CREATE TRIGGER actualizar_saldo_pago
AFTER INSERT ON Pagos
FOR EACH ROW
BEGIN
    UPDATE Facturas
    SET Saldo = Saldo - NEW.ValorAbono
    WHERE ID_Orden = NEW.ID_Orden;
END;
//

CREATE TRIGGER insertar_fecha_pago_actual
BEFORE INSERT ON Pagos
FOR EACH ROW
BEGIN
    IF NEW.FechaUltiPago IS NULL THEN
        SET NEW.FechaUltiPago = CURDATE();
    END IF;
END;
//

DELIMITER ;

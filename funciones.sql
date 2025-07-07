DELIMITER //


CREATE FUNCTION calcular_total_alquiler(id_alquiler INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT SUM(a.Precio)
    INTO total
    FROM Articulos_Alquiler aa
    JOIN Articulos a ON a.ID_Articulo = aa.ARTICULOSID_Articulo
    WHERE aa.ALQUILERID_Alquiler = id_alquiler;

    RETURN total;
END;
//


CREATE FUNCTION cantidad_articulos_por_usuario(doc VARCHAR(15))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT;

    SELECT COUNT(*)
    INTO cantidad
    FROM Alquiler a
    JOIN Articulos_Alquiler aa ON a.ID_Alquiler = aa.ALQUILERID_Alquiler
    WHERE a.Num_Doc = doc;

    RETURN cantidad;
END;
//


CREATE FUNCTION dias_de_alquiler(fechaRet DATE, fechaEnt DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN DATEDIFF(fechaEnt, fechaRet);
END;
//

DELIMITER ;
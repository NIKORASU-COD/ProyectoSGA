
#proceso de usuraio#
USE `proyectosga`;
DROP procedure IF EXISTS `insert_usuario`;

DELIMITER $$
USE `proyectosga`$$
CREATE PROCEDURE `insert_usuario` (
IN Num_Doc varchar(15),
IN Nom1 varchar (18),
IN Nom2 varchar (18),
IN Ape1 varchar (20),
IN Ape2 varchar (20),
IN Dirección varchar (35),
IN NumTel bigint,
IN Correo varchar (45),
IN Contra varchar (35),
IN ID_Barrio smallint,
IN ID_TipoDoc tinyint,
IN ID_Rol tinyint

)
BEGIN
INSERT INTO Usuarios (Num_Doc, Nom1, Nom2, Ape1, Ape2, Dirección, NumTel, Correo, Contraseña, ID_Barrio, ID_TipoDoc, ID_Rol)
VALUES (Num_Doc, Nom1, Nom2, Ape1, Ape2, Dirección, NumTel,Correo, Contra, ID_Barrio, ID_TipoDoc, ID_Rol);
END$$

DELIMITER ;

#proceso articulos#
USE `proyectosga`;
DROP procedure IF EXISTS `insert_articulos`;

DELIMITER $$
USE `proyectosga`$$
CREATE PROCEDURE `insert_articulos` (
IN NomArti varchar(30),
IN Genero varchar(15),
IN Talla varchar(5),
IN Color varchar(20),
IN Precio mediumint,
IN ID_Categoria tinyint

)
BEGIN
INSERT INTO Articulos ( NomArti, Genero, Talla, Color, Precio, ID_Categoria)
VALUES ( NomArti, Genero, Talla, Color, Precio, ID_Categoria);
END$$

DELIMITER ;

#proceso factura#
USE `proyectosga`;
DROP procedure IF EXISTS `insert_facturas`;

DELIMITER $$
USE `proyectosga`$$
CREATE PROCEDURE `insert_facturas` (
IN FeFac timestamp,
IN Saldo mediumint,
IN ID_Alquiler smallint
)
BEGIN
INSERT INTO Facturas (Saldo, ID_Alquiler)
VALUES ( Now(),Saldo, ID_Alquiler);
END$$

DELIMITER ;

#proceso pago#
USE `proyectosga`;
DROP procedure IF EXISTS `insert_pagos`;

DELIMITER $$
USE `proyectosga`$$
CREATE PROCEDURE `insert_pagos` (
IN FechaUltiPago date,
IN ValorAbono mediumint,
IN ID_Orden smallint
)
BEGIN
INSERT INTO pagos(FechaUltiPago ,ValorAbono,ID_Orden)
VALUE (FechaUltiPago ,ValorAbono,ID_Orden);
END$$

DELIMITER ;

#proceso alquiler#
USE `proyectosga`;
DROP procedure IF EXISTS `insert_alquiler`;

DELIMITER $$
USE `proyectosga`$$
CREATE PROCEDURE `insert_alquiler` (
IN FechaRet date,
IN FechaEnt date,
IN Num_Doc varchar(15)
)

BEGIN
INSERT INTO Alquiler (FechaRet,FechaEnt,Num_Doc)
VALUES (FechaRet,FechaEnt,Num_Doc );
END$$

DELIMITER ;

#proceso de insertar articulo al alquler
USE `proyectosga`;
DROP procedure IF EXISTS `Insert_Art_Alq`;

DELIMITER $$
USE `proyectosga`$$
CREATE PROCEDURE Insert_Art_Alq (
IN id_alq smallint,
IN id_art smallint,
IN observaciones varchar(60)
)
BEGIN
INSERT INTO articulos_alquiler(ARTICULOSID_Articulo, ALQUILERID_Alquiler, Observaciones) VALUES (id_alq,id_art,observaciones);
END$$

DELIMITER ;
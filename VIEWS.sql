# Vista para ver todos los datos del cliente
CREATE VIEW DatosCliente AS
SELECT u.Num_Doc, CONCAT(u.Nom1," ", u.Nom2," ", u.Ape1," ", u.Ape2) AS Nombre, u.Dirección, u.NumTel, ba.NomBar, td.NomDoc, ro.NomRol, u.CorreoElec
FROM usuarios as u
JOIN barrio as ba
ON u.ID_Barrio = ba.ID_Barrio
JOIN documento as td
ON u.ID_TipoDoc = td.ID_TipoDoc
JOIN roles as ro
ON u.ID_Rol = ro.ID_Rol;

SELECT * FROM DatosCliente;

# Vista para ver los alquileres 

CREATE VIEW Alquileres AS
SELECT 
  AA.ALQUILERID_Alquiler,
  AA.ARTICULOSID_Articulo,
  AR.NomArti,
  AR.Color,
  AR.Talla,
  C.NomCat AS Categoria,
  AA.Observaciones,
  U.Num_Doc,
  CONCAT(U.Nom1, ' ', U.Nom2, ' ', U.Ape1, ' ', U.Ape2) AS NombreCompleto,
  calcular_total_alquiler(AA.ALQUILERID_Alquiler) AS Total_Alquiler
FROM Articulos_Alquiler AS AA
JOIN Articulos AS AR ON AA.ARTICULOSID_Articulo = AR.ID_Articulo
JOIN Categorias AS C ON AR.ID_Categoria = C.ID_Categoria
JOIN Alquiler AS ALQ ON AA.ALQUILERID_Alquiler = ALQ.ID_Alquiler
JOIN Usuarios AS U ON ALQ.Num_Doc = U.Num_Doc;

SELECT * FROM Alquileres;

# Vista para ver informacion completa de los artículos
CREATE VIEW ArticulosDetalles AS
SELECT 
  A.ID_Articulo,
  A.NomArti,
  A.Genero,
  A.Talla,
  A.Color,
  A.Precio,
  C.NomCat AS Categoria
FROM Articulos A
JOIN Categorias C ON A.ID_Categoria = C.ID_Categoria;

SELECT * FROM ArticulosDetalles;

# Vista de la factura 
CREATE VIEW Facturacion AS
SELECT 
  F.ID_Orden,
  F.FechaFac,
  F.Saldo,
  U.Num_Doc,
  CONCAT(U.Nom1, ' ', U.Ape1) AS Nombre_Completo,
  A.FechaRet,
  A.FechaEnt
FROM Facturas as F
JOIN Alquiler as A ON F.ID_Alquiler = A.ID_Alquiler
JOIN Usuarios as U ON A.Num_Doc = U.Num_Doc;

SELECT * FROM Facturacion;

# Vista para consultar los pagos hechos
CREATE VIEW PagosFactura AS
SELECT 
  P.ID_Pago,
  P.FechaUltiPago,
  P.ValorAbono,
  P.ID_Orden,
  F.Saldo,
  F.FechaFac
FROM Pagos as P
JOIN Facturas as F ON P.ID_Orden = F.ID_Orden;

SELECT * FROM PagosFactura;



DROP DATABASE IF EXISTS ProyectoSGA;
CREATE DATABASE ProyectoSGA;
USE ProyectoSGA;

CREATE TABLE Barrio (
ID_Barrio smallint primary key auto_increment,
NomBar varchar(30)
);

CREATE TABLE Documento (
ID_TipoDoc tinyint primary key auto_increment,
NomDoc int 
);

CREATE TABLE Roles (
ID_Rol tinyint primary key auto_increment,
NomRol varchar(15)
);

CREATE TABLE Categorias (
ID_Categoria tinyint primary key auto_increment,
NomCat varchar(30),
Descripción varchar(45)
);

CREATE TABLE Articulos (
ID_Articulo smallint primary key auto_increment,
NomArti varchar(30),
Genero varchar(15),
Talla varchar(5),
Color varchar(20),
Precio mediumint,
ID_Categoria tinyint
);

CREATE TABLE Facturas (
ID_Orden smallint primary key auto_increment,
FechaFac date,
Saldo mediumint,
ID_Alquiler smallint
);

CREATE TABLE Pagos (
ID_Pago smallint primary key auto_increment,
FechaUltiPago date,
ValorAbono mediumint,
ID_Orden smallint
);

CREATE TABLE Alquiler (
ID_Alquiler smallint primary key auto_increment,
FechaRet date,
FechaEnt date,
Num_Doc varchar(15)
);

CREATE TABLE Usuarios (
Num_Doc varchar(15) primary key,
Nom1 varchar (18),
Nom2 varchar (18),
Ape1 varchar (20),
Ape2 varchar (20),
Dirección varchar (35),
NumTel bigint,
ID_Barrio smallint,
ID_TipoDoc tinyint,
ID_Rol tinyint
);

CREATE TABLE Facturas_Articulos (
	ID_Orden smallint,
    ID_Articulo smallint,
    Precio mediumint,
    Cantidad smallint
);

CREATE TABLE Articulos_Alquiler (
	ARTICULOSID_Articulo smallint,
    ALQUILERID_Alquiler smallint,
    Estado boolean
);

# Llaves foraneas tabla usuarios #
ALTER TABLE Usuarios 
ADD CONSTRAINT FK_Usuario_Barrio
FOREIGN KEY (ID_Barrio) REFERENCES Barrio (ID_Barrio);

ALTER TABLE Usuarios 
ADD CONSTRAINT FK_Usuario_TipoDoc
FOREIGN KEY (ID_TipoDoc) REFERENCES Documento (ID_TipoDoc);

ALTER TABLE Usuarios 
ADD CONSTRAINT FK_Usuario_Rol
FOREIGN KEY (ID_Rol) REFERENCES Roles (ID_Rol);

# Llave foranea tabla usuarios #
ALTER TABLE Alquiler 
ADD CONSTRAINT FK_Alquiler_Usuario
FOREIGN KEY (Num_Doc) REFERENCES Usuarios (Num_Doc);

# Llave foranea tabla facturas #
ALTER TABLE Facturas
ADD CONSTRAINT FK_Factura_Alquiler
FOREIGN KEY (ID_Orden) REFERENCES Alquiler (ID_Alquiler);

# Llave foranea tabla pagos #
ALTER TABLE Pagos
ADD CONSTRAINT FK_Pagos_Factura
FOREIGN KEY (ID_Orden) REFERENCES Facturas (ID_Orden);

# Llave foranea tabla articulos #
ALTER TABLE Articulos 
ADD CONSTRAINT FK_Articulos_Categoria
FOREIGN KEY (ID_Categoria) REFERENCES Categorias (ID_Categoria);

# llaves compuestas tabla Articulos_Alquiler 
ALTER TABLE Articulos_Alquiler
ADD CONSTRAINT PK_Articulos_Alquiler
PRIMARY KEY(ARTICULOSID_articulo, ALQUILERID_Alquiler);
ALTER TABLE Articulos_Alquiler
ADD CONSTRAINT FK_Articulos
FOREIGN KEY (ARTICULOSID_articulo) REFERENCES Articulos(ID_Articulo);
ALTER TABLE Articulos_Alquiler
ADD CONSTRAINT FK_Articulos_Alquiler
FOREIGN KEY (ALQUILERID_Alquiler) REFERENCES Alquiler(ID_Alquiler);
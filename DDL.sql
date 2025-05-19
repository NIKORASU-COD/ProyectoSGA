DROP DATABASE IF EXISTS ProyectoSGA;
CREATE DATABASE ProyectoSGA;
USE ProyectoSGA;

CREATE TABLE Barrio (
ID_Barrio smallint primary key auto_increment,
NomBarrio varchar(30)
);

CREATE TABLE Documento (
ID_TipoDoc tinyint primary key auto_increment,
NomDoc int 
);

CREATE TABLE Categorias (
ID_Categoria tinyint primary key auto_increment,
NomCat varchar(30),
Descripción varchar(45)
);

CREATE TABLE Roles (
ID_Rol tinyint primary key auto_increment,
NomRol varchar(15)
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
	ID_Articulo smallint,
    ID_Alquiler smallint,
    Estado boolean
)
